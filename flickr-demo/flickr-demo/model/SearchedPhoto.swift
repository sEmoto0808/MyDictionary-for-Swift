//
//  Photo.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/12.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import RealmSwift

class SearchedPhoto: Object {
    
    dynamic var photoID = 0
    dynamic var photoURL = ""
    dynamic var favorite = 0
    
    override static func primaryKey() -> String? {
        return "photoID"
    }
}
