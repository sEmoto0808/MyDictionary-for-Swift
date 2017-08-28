//
//  Tweet.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

final class Tweet: Mappable {
    
    var text = ""
    var user = [User]()
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        text <- map["text"]
        user <- map["user"]
    }
}

final class User: Mappable {
    
    var name = ""
    var screenName = ""
    var profileImage = ""
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        name <- map["name"]
        screenName <- map["screen_name"]
        profileImage <- map["profile_image_url"]
    }
}

