//
//  FlickrBaseParamsBuilder.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/10.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

final class FlickrBaseParamsBuilder {
    
    static func create() -> [String: Any] {
        
        return [
            "method" : "flickr.photos.search",
            "api_key" : "0e9bb2d6ed208cb54c7a945d055f51f6",
            "nojsoncallback" : "1",
            "format": "json"]
    }
}
