//
//  Date+DateFormat.swift
//  new
//
//  Created by 江本匠 on 2017/07/29.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

import Foundation

extension Date {
    
    func dateStyleHHMM() -> String {
        
        let calendar = Calendar.current
        let components = calendar
            .dateComponents([.year, .month, .day, .hour, .minute],
                            from: self)
        
        if let hour = components.hour,
            let minite = components.minute {
            return String(format: "%02d:%02d",hour, minite)
        }
        return ""
    }
}
