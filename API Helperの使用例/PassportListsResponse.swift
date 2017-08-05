//
//  PassportListsResponse.swift
//  FirstPassport
//
//  Created by 江本匠 on 2017/07/16.
//  Copyright © 2017年 Smart Tech Ventures. All rights reserved.
//

import ObjectMapper

/// クーポン情報一覧取得APIのレスポンス
final class PassportListsResponse: Mappable {
    
    var passportId = ""
    var passportCode = ""
    var passportName = ""
    var useFlag = ""
    var aliasImagePath = ""
    var registImagePath = ""
    var unregistImagePath = ""
    var useCount = ""
    var remainCount = ""
    var description = ""
    var fromDatetime = ""
    var toDatetime = ""
    var fromUseTime = ""
    var toUseTime = ""
    var useDay = ""
    var spanId = ""
    
    init?(map: Map) {}
    
    func mapping(map: Map) {
        passportId <- map["coupon_id"]
        passportCode <- map["coupon_code"]
        passportName <- map["coupon_name"]
        useFlag <- map["use_flag"]
        aliasImagePath <- map["alias_image_path"]
        registImagePath <- map["regist_image_path"]
        unregistImagePath <- map["unregist_image_path"]
        useCount <- map["use_count"]
        remainCount <- map["remain_count"]
        description <- map["description"]
        fromDatetime <- map["from_datetime"]
        toDatetime <- map["to_datetime"]
        fromUseTime <- map["from_use_time"]
        toUseTime <- map["to_use_time"]
        useDay <- map["use_day"]
        spanId <- map["span_id"]
    }
}

