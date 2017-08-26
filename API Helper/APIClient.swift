//
//  APIClient.swift
//  01_API
//
//  Created by 江本匠 on 2017/08/08.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Alamofire

/// APIの処理結果
///
/// - success: 成功
/// - failure: 失敗
enum Result {
    case success(Any)
    case failure(Error)
}

final class APIClient {
    
    // APIをコールする
    //
    // - Return: APIの処理結果
    static func request(router: APIRouter,
                 completionHandler: @escaping (Result) -> Void = {_ in
        }) {
        
        Alamofire.request(router).responseJSON { response in
            
            switch response.result {
            case .success(let value):
                
                completionHandler(Result.success(value))
                
            case .failure:
                
                if let error = response.result.error {
                    
                    completionHandler(Result.failure(error))
                } else {
                    
                    fatalError("エラーのインスタンスがnil")
                }
            }
        }
    }
}
