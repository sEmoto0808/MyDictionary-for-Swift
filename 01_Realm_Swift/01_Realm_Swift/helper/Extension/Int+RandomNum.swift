//
//  Int+RandomNum.swift
//  01_Realm_Swift
//
//  Created by 江本匠 on 2017/07/27.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

public extension Int {
    
//    func random(lower: UInt32, upper: UInt32) -> UInt32 {
//        guard upper >= lower else {
//            return 0
//        }
//        
//        return arc4random_uniform(upper - lower) + lower
//    }
    
    public static
        func random(range: Range<Int>) -> Int {
        let min = range.lowerBound < 0 ? 0 : range.lowerBound
        let max = range.upperBound + 1
        let v = UInt32(max < min ? 0 : max - min)
        let r = Int(arc4random_uniform(v))
        return min + r
    }
    
//    func random(min n: Int, max x: Int) -> Int {
//        let min = n < 0 ? 0 : n
//        let max = x + 1
//        let v = UInt32(max < min ? 0 : max - min)
//        let r = Int(arc4random_uniform(v))
//        return min + r
//    }
    
}
