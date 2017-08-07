//
//  APIClient.swift


import Alamofire

/// APIの処理結果
///
/// - success: 成功
/// - failure: 失敗
enum Result<Value> {
    case success(Value)
    case failure(Error)
}

/// API Client
final class APIClient {
    
    /// ネットワーク接続状況確認
    ///
    /// - Returns: true: オンライン, false: オフライン
    static func isOnline() -> Bool {
        let networkReachability = NetworkReachabilityManager()
        networkReachability?.startListening()
        
        return networkReachability?.isReachable ?? false
    }
    
    /// APIをコールする
    ///
    /// - Returns: APIの処理結果
    static func request(router: Router, completionHandler: @escaping (Result<Any>) -> Void = { _ in}) {
        
        Alamofire.request(router).responseJSON { response in
            
            if let httpStatusCode = response.response?.statusCode.description {
                // output http status code.
                Logger.debug(message: "HTTP Status Code: \(httpStatusCode)")
            }
            
            if let error = response.result.error {
                Logger.debug(message: "Error code: \(error.code)")
                Logger.debug(message: "Error domain: \(error.domain)")
                Logger.debug(message: "Error localizedDescription: \(error.localizedDescription)")
            }
            
            Logger.debug(message: "\(response.description)")
            
            switch response.result {
            case .success(let value):
                completionHandler(.success(value))
                
            case .failure:
                if let error = response.result.error {
                    Logger.error(message: error.localizedDescription)
                    completionHandler(.failure(error))
                } else {
                    fatalError("エラーのインスタンスがnil")
                }
            }
        }
    }

    static func requestPostalCode(router: PostalCodeRouter, completionHandler: @escaping (Result<Any>) -> Void = { _ in}) {

        Alamofire.request(router).responseJSON { response in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value))

            case .failure:
                if let error = response.result.error {
                    Logger.error(message: error.localizedDescription)
                    completionHandler(.failure(error))
                } else {
                    fatalError("エラーのインスタンスがnil")
                }
            }
        }
    }
}
