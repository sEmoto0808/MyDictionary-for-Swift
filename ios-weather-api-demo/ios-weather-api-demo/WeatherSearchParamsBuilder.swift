//
//  WeatherSearchParamsBuilder.swift
//  ios-weather-api-demo
//
//  Created by 江本匠 on 2017/08/15.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

/// お天気APIのリクエストパラメタ生成
final class WeatherSearchParamsBuilder {
    
    static func create(cityID: String) -> [String: String] {
        
        var params = [String: String]()
        
        // 地域ID
        params["cityID"] = cityID
        
        return params
    }
}
