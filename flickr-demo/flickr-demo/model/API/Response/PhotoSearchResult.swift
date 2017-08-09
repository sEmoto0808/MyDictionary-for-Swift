//
//  PhotoSearchResult.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/10.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

final class PhotoSearchResult: Mappable {
    
    var stat = ""
    var photos = [Photos]()
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        stat <- map["stat"]
        photos <- map["photos"]
    }
}
