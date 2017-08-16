//
//  APIRouter.swift
//  01_API
//
//  Created by 江本匠 on 2017/08/08.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Alamofire //4.5.0

enum APIRouter: URLRequestConvertible {
    
    // baseURL
    static let baseURLString = "http://weather.livedoor.com/forecast/webservice/json/"
    
    // API pattern
    // APIによって可変
    case weatherSearch(params: [String: String])
    
    // URL request
    // - Return: URLリクエスト
    func asURLRequest() throws -> URLRequest {
        
        // urlPath -> API pattern固有のpath
        let (method, urlPath): (HTTPMethod, String) = {
            switch self {
                
            case .weatherSearch(let params):
                let id = params["cityID"] ?? ""
                return (.get, "v1?city=\(id)")
            }
        }()
        
        if let url = URL(string: APIRouter.baseURLString) {
            
            var urlRequest = URLRequest(url: url.appendingPathComponent(urlPath))
            urlRequest.httpMethod = method.rawValue
            urlRequest.timeoutInterval = 30
            
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: nil)
        } else {
            
            fatalError("URLがnil")
        }
    }
}

