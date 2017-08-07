//
//  Router.swift

import Alamofire

/// API Router
enum Router: URLRequestConvertible {

    // TODO: ベースURLは仕様が決まり次第修正

    /// ベースURL
    #if DEVELOPMENT
    static let fqdn = "coin.dev.ixit.jp"
    static let baseURLString = "https://" + fqdn + "/Core/api"
    #elseif STAGING
    static let fqdn = "coin.dev.ixit.jp"
    static let baseURLString = "https://" + fqdn + "/Core/api"
    #else
    static let fqdn = "coin.dev.ixit.jp"
    static let baseURLString = "https://" + fqdn + "/Core/api"
    #endif

    /// トークン
    case token(parameters: [String: Any], needsSessionToken: Bool)
    /// メールアドレス確認
    case mailConfirm(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザー情報登録
    case addUsers(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザー情報更新
    case updateUsers(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザーデバイス情報登録
    case addUserDevices(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザーデバイス情報更新
    case updateUserDevices(parameters: [String: Any], needsSessionToken: Bool)
    /// ログイン
    case login(parameters: [String: Any], needsSessionToken: Bool)
    /// ログアウト
    case logout(parameters: [String: Any], needsSessionToken: Bool)
    /// 店舗情報一覧取得
    case shopLists(parameters: [String: Any], needsSessionToken: Bool)
    /// 店舗情報取得
    case shopsDetail(parameters: [String: Any], needsSessionToken: Bool)
    /// パスワード再発行登録
    case passwordRemindsRegist(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザー決済情報取得
    case getUserPayments(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザー決済情報登録
    case addUsersComplete(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザ決済情報仮登録
    case preAddUsersPaymentsComplete(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザー決済情報変更
    case updateUserPayments(parameters: [String: Any], needsSessionToken: Bool)
    /// プラン解除
    case deleteUserPayments(parameters: [String: Any], needsSessionToken: Bool)
    /// パスワード変更
    case updateUserPassword(parameters: [String: Any], needsSessionToken: Bool)
    /// パスワード再発行確認
    case passwordRemindsConfirm(parameters: [String: Any], needsSessionToken: Bool)
    /// クーポン使用API
    case couponUse(parameters: [String: Any], needsSessionToken: Bool, couponHistoryId: String)
    /// クーポン仮使用API
    case preUse(parameters: [String: Any], needsSessionToken: Bool)
    /// クーポン情報取得API
    case couponsInfo(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザ退会
    case retire(parameters: [String: Any], needsSessionToken: Bool)
    /// 料金プラン管理関連API
    case getPricePlans(parameters: [String: Any], needsSessionToken: Bool)
    /// FAQ情報取得
    case faqLists(parameters: [String: Any], needsSessionToken: Bool)
    /// お問い合わせ情報登録
    case contacts(parameters: [String: Any], needsSessionToken: Bool)
    /// ユーザー情報取得
    case userInfoDetail(parameters: [String: Any], needsSessionToken: Bool)
    /// ニュース情報取得
    case news(parameters: [String: Any], needsSessionToken: Bool)
    /// クーポン情報一覧取得API
    case passportLists(parameters: [String: Any], needsSessionToken: Bool)
    
    /// URLリクエストを作成する
    ///
    /// - Returns: URLリクエスト
    func asURLRequest() throws -> URLRequest {

        let (method, path, parameters, needsSessionToken): (HTTPMethod, String, [String: Any], Bool) = {

            let userId = UserDefaults().string(forKey: Constants.UserDefaults.userId) ?? ""

            switch self {

            case .token(let params, let needsSessionToken):
                return (.post, "/tokens", params, needsSessionToken)

            case .mailConfirm(let params, let needsSessionToken):
                return (.get, "/tokens/", params, needsSessionToken)

            case .addUsers(let params, let needsSessionToken):
                return (.post, "/users", params, needsSessionToken)

            case .updateUsers(let params, let needsSessionToken):
                return (.put, "/users/\(userId)", params, needsSessionToken)

            case .addUserDevices(let params, let needsSessionToken):
                return (.post, "/user_devices", params, needsSessionToken)

            case .updateUserDevices(let params, let needsSessionToken):
                return (.put, "/v1/user_devices/\(userId)", params, needsSessionToken)

            case .login(let params, let needsSessionToken):
                return (.post, "/login", params, needsSessionToken)
                
            case .logout(let params, let needsSessionToken):
                return (.get, "/logout", params, needsSessionToken)
                
            case .shopLists(let params, let needsSessionToken):
                return (.get, "/shop_lists", params, needsSessionToken)

            case .shopsDetail(let params, let needsSessionToken):
                let shopId = params["shop_id"] ?? ""
                return (.get, "/shops/\(shopId)", params, needsSessionToken)

            case .passwordRemindsRegist(let params, let needsSessionToken):
                return (.post, "/password_reminds", params, needsSessionToken)

            case .getUserPayments (let params, let needsSessionToken):
                return (.get, "/user_payments/\(userId)", params, needsSessionToken)

            case .addUsersComplete(let params, let needsSessionToken):
                return (.put, "/user_payments/\(userId)", params, needsSessionToken)

            case .preAddUsersPaymentsComplete(let params, let needsSessionToken):
                return (.put, "/user_payments", params, needsSessionToken)

            case .updateUserPayments (let params, let needsSessionToken):
                return (.put, "/new_user_payments/\(userId)", params, needsSessionToken)

            case .deleteUserPayments (let params, let needsSessionToken):
                return (.delete, "/new_user_payments/\(userId)", params, needsSessionToken)
                
            case .updateUserPassword(let params, let needsSessionToken):
                return (.put, "/user_passwords/\(userId)", params, needsSessionToken)

            case .passwordRemindsConfirm(let params, let needsSessionToken):

                let remindCode = params["remind_code"] ?? ""

                return (.get, "/password_reminds/\(remindCode)", params, needsSessionToken)
                
            case .couponUse(let params, let needsSessionToken, let couponHistoryId):
                return (.put, "/coupons/\(couponHistoryId)", params, needsSessionToken)
                
            case .preUse(let params, let needsSessionToken):
                return (.post, "/coupons", params, needsSessionToken)

            case .couponsInfo(let params, let needsSessionToken):
                return (.get, "/coupons", params, needsSessionToken)

            case .retire(let params, let needsSessionToken):
                return (.delete, "/users/\(userId)", params, needsSessionToken)

            case .getPricePlans(let params, let needsSessionToken):
                return (.get, "/price_plans", params, needsSessionToken)

            case .faqLists(let params, let needsSessionToken):
                return (.get, "/faqs", params, needsSessionToken)

            case .contacts(let params, let needsSessionToken):
                return (.post, "/contacts", params, needsSessionToken)
                
            case .userInfoDetail(let params, let needsSessionToken):
                return (.get, "/users/", params, needsSessionToken)
                
            case .news(let params, let needsSessionToken):
                return (.get, "/news", params, needsSessionToken)
            
            case .passportLists(let params, let needsSessionToken):
                return (.get, "/coupon_lists", params, needsSessionToken)
            }
        }()

        let url = URL(string: Router.baseURLString)
        var urlRequest = URLRequest(url: url!.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 30

        // Custom Header Fields

        // アプリケーションキー (required)
        urlRequest.setValue(CustomHTTPHeadersBuilder.appKey,
                            forHTTPHeaderField: Constants.CustomHTTPHeaderFields.appKey)

        // タイムスタンプ (required)
        let now = Date()
        let timeStamp = CustomHTTPHeadersBuilder.createTimeStamp(date: now)
        urlRequest.setValue(timeStamp,
                            forHTTPHeaderField: Constants.CustomHTTPHeaderFields.timeStamp)

        // シグネチャ (required)
        let signature = CustomHTTPHeadersBuilder.createSignature(httpMethod: method,
                                                                 fqdn: Router.fqdn,
                                                                 apiPath: path,
                                                                 timeStamp: timeStamp)
        urlRequest.setValue(signature,
                            forHTTPHeaderField: Constants.CustomHTTPHeaderFields.signature)

        // セッショントークン
        if let sessionToken = CustomHTTPHeadersBuilder.sessionToken(ifNeeded: needsSessionToken) {
            urlRequest.setValue(sessionToken,
                                forHTTPHeaderField: Constants.CustomHTTPHeaderFields.sessionToken)
        }
        
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
    }
}
