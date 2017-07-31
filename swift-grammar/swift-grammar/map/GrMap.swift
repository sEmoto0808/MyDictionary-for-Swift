//
//  GrMap.swift
//  swift-grammar
//
//  Created by 江本匠 on 2017/07/31.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class GrMap: NSObject {
    
    // .mapは全要素に処理を施したい時に使う。
    // .mapは返り値が使用されていない場合にwarningを出します。
    // 戻り値が必要ないけど配列内の全要素に処理を行いたい場合はforEachを使用する
    func baseIntMap(array: Array<Int>) {
        
        print(".mapについて")
        let mapArray = array.map { $0 * 5 }
        print("mapArray: \(mapArray)\n")
    }

}
