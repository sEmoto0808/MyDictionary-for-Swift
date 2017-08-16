//
//  Forecast.swift
//  ios-weather-api-demo
//
//  Created by 江本匠 on 2017/08/15.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

/// お天気APIのレスポンス
final class Forecast: Mappable {
    
    var dateLabel = ""
    var telop = ""
    var date = ""
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        dateLabel <- map["dateLabel"]
        telop <- map["telop"]
        date <- map["date"]
    }
}

