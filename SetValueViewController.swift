//
//  SetValueViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/15.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class SetValueViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var setValueStr: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setValueStr.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func didTapReceiveValue(_ sender: Any) {
        
        let vc = ReceiveValueViewController.create()
        vc.receiveValueStr = self.setValueStr.text!
        
        navigationController?.pushViewController(vc, animated: true)
        
    }

}
