//
//  GrEnumerate.swift
//  swift-grammar
//
//  Created by 江本匠 on 2017/07/31.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class GrEnumerate: NSObject {
    
    // 要素と要素のインデックスが欲しい時に使う.
    func baseIntEnumerate(array: Array<Int>) {
        
        print(".enumerateについて")
        for (index, score) in array.enumerated() {
            
            print("index:\(index), score: \(score)")
        }
        print("\n")
    }
    
    // MARK: - forEachとの組み合わせ
    func getEnumerateWithForEach(array: Array<Int>) {
        
        array.enumerated().forEach { print("index:\($0.0), score: \($0.1)") }
        print("\n")
    }

}
