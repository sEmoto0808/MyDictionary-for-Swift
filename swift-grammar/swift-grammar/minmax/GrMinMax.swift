//
//  GrMinMax.swift
//  swift-grammar
//
//  Created by 江本匠 on 2017/07/31.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class GrMinMax: NSObject {
    
    // 最小値が欲しい時に使う.
    func baseIntMin(array: Array<Int>) {
        
        print(".minについて")
        // Optionalで返ってくる
        let min = array.min()
        print("min: \(String(describing: min))\n")
    }
    
    // 最大値が欲しい時に使う.
    func baseIntMax(array: Array<Int>) {
        
        print(".maxについて")
        // Optionalで返ってくる
        let max = array.max()
        print("max: \(String(describing: max))\n")
    }

}
