//
//  SongListParamsBuilder.swift
//  ios-iTunesSearch-practice
//
//  Created by 江本匠 on 2017/09/07.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

final class SongListParamsBuilder {
    
    static func create(keyword: String) -> [String: String] {
        
        var params = [String: String]()
        
        params["keyword"] = keyword
        
        return params
    }
}
