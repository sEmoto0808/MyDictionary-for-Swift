//
//  SecondViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/07.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    static func create() -> SecondViewController {
        
        guard let vc = UIStoryboard.viewController(storyboardName:
            SecondViewController.className,
                                                   identifier: SecondViewController.className) as? SecondViewController else {
                                                    fatalError("unwap SecondViewController")
        }
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
