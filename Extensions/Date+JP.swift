//
//  Date+JP.swift
//  STV-Extensions
//
//  Created by 江本匠 on 2017/07/29.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

public extension Date {
    
    func now() -> Date {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.date(from: formatter.string(from:self))!
    }
}
