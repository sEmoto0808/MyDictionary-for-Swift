//
//  BMICalculatorTests.swift
//  01_TestCode
//
//  Created by 江本匠 on 2017/08/09.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import XCTest
@testable import _1_TestCode

class BMICalculatorTests: XCTestCase {
    
    /// テスト開始前に毎回呼ばれる
    override func setUp() {
        super.setUp()
    }
    
    /// テスト終了後に毎回呼ばれる
    override func tearDown() {
        super.tearDown()
    }
    
    func testCalculate() {
        let testHeight: Float = 1.8
        let testWeight: Float = 70.0
        
        // BMICalculator.calculateの返り値が21.6と等しいことをテスト
        XCTAssertEqual(BMICalculator.calculate(height: testHeight, weight: testWeight), 21.6)
    }

}
