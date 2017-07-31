//
//  GrFilter.swift
//  swift-grammar
//
//  Created by 江本匠 on 2017/07/31.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class GrFilter: NSObject {
    
    // .filterは条件に合う要素のみ取り出したい時に使う．
    func baseIntFilter(array: Array<Int>) {
        
        print(".filterについて")
        let filterArray = array.filter {$0 < 3}
        print("filterArray: \(filterArray)")
    }
    
    func baseStringFilter(array: Array<String>) {
        
        let filterArray = array.filter {$0 == "test"}
        print("filterArray: \(filterArray)")
    }
    
    // MARK: - .mapとの組み合わせ
    func exchangeFilterWithMap(dict: Dictionary<String, Double>) {
        // mapで摂氏を華氏に変換してから、filterで華氏60度以上の地域を絞り込み、
        // mapで地域名だけを取り出しています。
        let fahrenheit = dict.map {($0.0, 1.8 * $0.1 + 32)}.filter {$0.1 > 60}.map {$0.0}
        print("fahrenheit: \(fahrenheit)\n")
        // fahrenheit: ["Osaka", "Okinawa"]
    }

}
