//
//  Photos.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/10.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

final class Photos: Mappable {
    
    var page = 0
    var pages = 0
    var perpage = 0
    var photo = [Photo]()
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        page <- map["page"]
        pages <- map["pages"]
        perpage <- map["perpage"]
        photo <- map["photo"]
    }
}
