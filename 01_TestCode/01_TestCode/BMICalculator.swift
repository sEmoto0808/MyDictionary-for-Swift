//
//  BMICalculator.swift
//  01_TestCode
//
//  Created by 江本匠 on 2017/08/09.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

// Modelクラス (同期処理サンプル)
class BMICalculator: NSObject {
    
    // BMI計算
    //
    // - Parameters:
    //   - height: 身長(m)
    //   - weight: 体重(kg)
    // - Returns: BMI計算結果 (小数点第2位切り捨て)
    static func calculate(height: Float, weight: Float) -> Float {
        
        let squareOfHeight = height * height
        let bmi = (weight / squareOfHeight) * 10
        
        return floor(bmi) / 10
    }

}
