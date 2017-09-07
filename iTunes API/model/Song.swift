//
//  Song.swift
//  ios-iTunesSearch-practice
//
//  Created by 江本匠 on 2017/09/07.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

final class Song: Mappable {
    
    var artistName = ""
    var trackName = ""
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        
        artistName <- map["artistName"]
        trackName <- map["trackName"]
    }
}
