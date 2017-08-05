//
//  postalCodeRouter.swift

import Alamofire

/// 郵便番号API Router
enum PostalCodeRouter: URLRequestConvertible {

    // ATS対応済み
    static let baseURLString = "http://zipcloud.ibsnet.co.jp"

    case search(parameters: [String: Any])

    func asURLRequest() throws -> URLRequest {

        let (method, path, parameters): (HTTPMethod, String, [String: Any]) = {

            switch self {
            case .search(let params):
                return (.get, "/api/search", params)
            }
        }()

        if let url = URL(string: type(of: self).baseURLString) {
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            urlRequest.timeoutInterval = 30
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
        } else {
            fatalError("URLがnil")
        }
    }
}
