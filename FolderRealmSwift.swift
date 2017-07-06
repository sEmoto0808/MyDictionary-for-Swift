//
//  MemoRealmSwift.swift
//  20170527_skillup
//
//  Created by 江本匠 on 2017/05/27.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift

/*
 * Realmモデルの例
 */


class FolderRealmSwift: Object {
    
    dynamic var title = ""

}

/*
 * プライマリーキー
 * folerId
 */
class UniqueFolderObject: Object {
    dynamic var folerId = 0
    
    override static func primaryKey() -> String? {
        return "folerId"
    }
    
}
