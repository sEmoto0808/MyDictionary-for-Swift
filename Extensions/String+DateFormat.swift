//
//  String+DateFormat.swift
//  new
//
//  Created by 江本匠 on 2017/07/29.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

extension String {
    
    func toDateStyleMedium(dateFormat: String) -> Date  {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.date(from: self)!
    }
}
