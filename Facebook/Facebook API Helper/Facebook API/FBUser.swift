//
//  FBUser.swift
//  ios-facebook-practice
//
//  Created by 江本匠 on 2017/09/01.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

final class FBUser: Mappable {
    
    var userName = ""
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        userName <- map["user_name"]
    }
}
