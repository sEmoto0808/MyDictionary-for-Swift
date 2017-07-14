//
//  ReceiveValueViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/15.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class ReceiveValueViewController: UIViewController {

    @IBOutlet weak var showValueStr: UILabel!
    
    var receiveValueStr: String = "preReceived"
    
    static func create() -> ReceiveValueViewController {
        
        guard let vc = UIStoryboard.viewController(storyboardName: ReceiveValueViewController.className,
                                                   identifier: ReceiveValueViewController.className) as? ReceiveValueViewController else {
                                                    fatalError("unwap ViewController")
        }
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showValueStr.text = receiveValueStr
    }
}
