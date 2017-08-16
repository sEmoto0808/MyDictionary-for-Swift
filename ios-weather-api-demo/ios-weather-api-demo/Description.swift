//
//  Description.swift
//  ios-weather-api-demo
//
//  Created by 江本匠 on 2017/08/15.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

/// お天気APIのレスポンス
final class Description: Mappable {
    
    var text = ""
    var descripTime = ""
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        text <- map["text"]
        descripTime <- map["publicTime"]
    }
}
