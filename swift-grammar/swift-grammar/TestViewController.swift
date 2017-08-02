//
//  TestViewController.swift
//  swift-grammar
//
//  Created by 江本匠 on 2017/07/31.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    fileprivate let intArray = [1, 2, 3, 4, 5]
    fileprivate let stringArray = ["あ", "A", "1", "テスト", "test"]
    fileprivate let celsius = ["Tokyo": 14.0, "Osaka": 17.0, "Okinawa": 27.0]
    
    let map = GrMap()
    let filter = GrFilter()
    let reduce = GrReduce()
    let forEach = GrForEach()
    let enumerate = GrEnumerate()
    let minMax = GrMinMax()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
        map.baseIntMap(array: intArray)
        map.changeString(array: intArray)
        
        filter.baseIntFilter(array: intArray)
        filter.baseStringFilter(array: stringArray)
        filter.exchangeFilterWithMap(dict: celsius)
        
        reduce.baseIntReduce(array: intArray)
        reduce.exchangeReduceWithMap(dict: celsius)
        
        forEach.baseIntForEach(array: intArray)
        
        enumerate.baseIntEnumerate(array: intArray)
        enumerate.getEnumerateWithForEach(array: intArray)
        
        minMax.baseIntMin(array: intArray)
        minMax.baseIntMax(array: intArray)
    }

}

// file private
extension TestViewController {
    
    func setup() {
        
        print("intArray: \(intArray)")
        print("stringArray: \(stringArray)")
        print("celsius: \(celsius)\n")
    }
}
