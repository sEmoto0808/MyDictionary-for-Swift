//
//  CustomHTTPHeadersBuilder.swift

import Alamofire
import STV_Extensions

/// HTTPヘッダ情報生成クラス
final class CustomHTTPHeadersBuilder {
    
    // アプリケーションキー, クライアントキー
    #if DEVELOPMENT
    static let appKey = "1q2w3e4r5t6y7u"
    static let clientKey = ""
    #elseif STAGING
    static let appKey = "1q2w3e4r5t6y7u"
    static let clientKey = ""
    #else
    static let appKey = "1q2w3e4r5t6y7u"
    static let clientKey = ""
    #endif
 
    /// シグネチャ生成
    static func createSignature(httpMethod: HTTPMethod,
                                fqdn: String,
                                apiPath: String,
                                timeStamp: String) -> String {
        
        let signatureMethod = "HmacSHA256"
        var signature = ""
        
        // リクエストメソッド
        signature += "\(httpMethod.rawValue)\n"
        // FQDN
        signature += "\(fqdn)\n"
        // APIパス
        signature += "\(apiPath)\n"
        // アプリケーションキー・シグネチャメソッド・タイムスタンプを「&」で連結
        signature += "SignatureMethod"
        signature += "=\(signatureMethod)"
        signature += "&\(Constants.CustomHTTPHeaderFields.appKey)"
        signature += "=\(appKey)"
        signature += "&\(Constants.CustomHTTPHeaderFields.timeStamp)"
        signature += "=\(timeStamp)"
        
        return signature.hmacSHA256(key: clientKey)
    }
    
    /// タイムスタンプ生成
    static func createTimeStamp(date: Date) -> String {
        return date.toStr(dateFormat: "yyyy-MM-dd HH:mm:ss")
    }
    
    /// UserDefaultsに保存されているセッショントークンを取得
    ///
    /// - Parameter ifNeeded: セッショントークンの指定が必要か (default: true)
    /// - Returns: セッショントークン
    static func sessionToken(ifNeeded: Bool = true) -> String? {
        guard ifNeeded else {
            return nil
        }
        return UserDefaults().string(forKey: Constants.UserDefaults.sessionToken)
    }
}
