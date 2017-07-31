//
//  GrForEach.swift
//  swift-grammar
//
//  Created by 江本匠 on 2017/07/31.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class GrForEach: NSObject {
    
    // 各要素に対して処理を行い、かつ戻り値が必要ない場合に使用する。
    func baseIntForEach(array: Array<Int>) {
        
        print(".forEachについて")
        array.forEach { print("forEach: \($0)") }
        print("\n")
    }

}
