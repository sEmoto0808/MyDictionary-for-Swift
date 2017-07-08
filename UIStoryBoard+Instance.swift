//
//  UIStoryBoard+Instance.swift
//  new
//
//  Created by 江本匠 on 2017/07/09.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    /// Storyboardからインスタンスを取得する
    class func viewController<T: UIViewController>(storyboardName: String,
                              identifier: String) -> T? {
        
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(
            withIdentifier: identifier) as? T
    }
}
