//
//  MemoRealmSwift.swift
//  20170527_skillup
//
//  Created by 江本匠 on 2017/05/27.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift

class UserMessage: Object {
    
    dynamic var messageID = 0
    dynamic var message = ""
    dynamic var updated = Date().now()
    
    // DBに保存しない
    var postDate: String {
        return updated.dateStyleHHMM()
    }
    
    override static func primaryKey() -> String? {
        return "messageID"
    }

}
