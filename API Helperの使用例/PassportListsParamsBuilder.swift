//
//  PassportListsParamsBuilder.swift
//  FirstPassport
//
//  Created by 江本匠 on 2017/07/16.
//  Copyright © 2017年 Smart Tech Ventures. All rights reserved.
//

import Foundation

/// クーポン情報一覧取得APIのリクエストパラメタ生成
final class PassportListsParamsBuilder {
    
    static func create(passportName: String) -> [String: String] {
        
        var params = [String: String]()
        
        // ユーザーID
        let userId = UserDefaults().string(forKey: Constants.UserDefaults.userId)
        params["user_id"] = userId
        
        // クーポン名
        params["coupon_name"] = passportName
        
        // データ制限数
        params["limit"] = ""
        
        // データ取得位置
        params["offset"] = ""
        
        // ソート順
        params["sort"] = ""
        
        return params
    }
}
