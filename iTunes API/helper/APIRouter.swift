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
    static let baseURLString = "https://itunes.apple.com/search"
    
    // API pattern
    // APIによって可変
    case musicSearch([String: String])
    
    // URL request
    // - Return: URLリクエスト
    func asURLRequest() throws -> URLRequest {
        
        // urlPath -> API pattern固有のpath
        let (method, urlPath, parameters): (HTTPMethod, String, [String: String]) = {
            switch self {
            case .musicSearch(let params):
                let artist = params["keyword"]  ?? ""
                return (.get, "?term=\(artist)&country=JP&lang=ja_jp&media=music", params)
            }
        }()
        
        if let url = URL(string: APIRouter.baseURLString) {
            
            var urlRequest = URLRequest(url: url.appendingPathComponent(urlPath))
            urlRequest.httpMethod = method.rawValue
            urlRequest.timeoutInterval = 30
            
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
        } else {
            
            fatalError("URLがnil")
        }
    }
}

