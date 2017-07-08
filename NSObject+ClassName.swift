//
//  NSObject+ClassName.swift
//  new
//
//  Created by 江本匠 on 2017/07/09.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

public extension NSObject {
    
    /// クラス名を取得する
    static var className: String {
        get {
            return String(describing: self)
        }
    }
}
