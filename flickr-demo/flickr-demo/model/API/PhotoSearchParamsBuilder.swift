//
//  PhotoSearchParamsBuilder.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/10.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

final class PhotoSearchParamsBuilder {
    
    static let perPage = 50
    
    static func create(tags: String) -> [String: Any] {
        
        var params = [String: Any]()
        
        //params["page"] = "\(page)"
        params["per_page"] = "\(perPage)"
        params["tags"] = "\(tags)"
        
        return params
    }
}
