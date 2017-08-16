//
//  WeatherSearchResponse.swift
//  ios-weather-api-demo
//
//  Created by 江本匠 on 2017/08/15.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

/// お天気APIのレスポンス
final class WeatherSearchResponse: Mappable {
    
    var time = ""
    var title = ""
    var description = [Description]()
    var forecasts = [Forecasts]()
    
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        time <- map["publicTime"]
        title <- map["title"]
        description <- map["description"]
        forecasts <- map["forecasts"]
    }
}
