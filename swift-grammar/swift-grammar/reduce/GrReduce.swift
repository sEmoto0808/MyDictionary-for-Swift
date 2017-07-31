//
//  GrReduce.swift
//  swift-grammar
//
//  Created by 江本匠 on 2017/07/31.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class GrReduce: NSObject {
    
    // .reduceは要素をまとめて集計したい時に使う．
    func baseIntReduce(array: Array<Int>) {
        
        print(".reduceについて")
        let reduce = array.reduce(0, +)
        print("reduce: \(reduce)")
        // reduce: 15
    }
    
    // MARK: - .mapとの組み合わせ
    func exchangeReduceWithMap(dict: Dictionary<String, Double>) {
        // 以下のコードでは、mapで摂氏を華氏に変換してから、reduceで全地域の温度を
        // 足し合わせたものを要素数で割り、華氏での平均気温を算出しています。
        let average = dict.map { 1.8 * $0.1 + 32 } .reduce(0, +) / Double(dict.count)
        print("average: \(average)\n")
        // average: 66.8
    }

}
