//
//  Photo.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/10.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

final class Photo: Mappable {
    
    var farm = 0
    var server = ""
    var id = ""
    var secret = ""
    
    init?(map: Map){}
    
    func mapping(map: Map) {
        farm    <- map["farm"]
        server  <- map["server"]
        id      <- map["id"]
        secret  <- map["secret"]
    }
}
