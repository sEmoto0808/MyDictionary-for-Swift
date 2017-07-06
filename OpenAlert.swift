//
//  OpenAlert.swift
//  new
//
//  Created by 江本匠 on 2017/07/06.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class OpenAlert: UIAlertController {

    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red

        // Do any additional setup after loading the view.
    }
    */
    
    /*
     * Alertを呼び出すViewController内で以下を実装すること
     *
     * present(alertController, animated: true, completion: nil)
     *
     */
    func openTextAlert() -> UIAlertController {
        let alertController = UIAlertController(title: "フォルダ名を入力してください。", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction) in
            
            print("OK!")
            /*
             * テキストフィールドの値に対する処理
             *
             
            let textFields:Array<UITextField>? = alertController.textFields as Array<UITextField>?
            
            if textFields != nil {
                for textField:UITextField in textFields! {
                    
                    print("textFieldの内容を表示\(textField.text ?? String())")
             
                }
            }
            */
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        /*
         * Alertにテキストフィールドを表示する場合
         *
         
        alertController.addTextField { text in
            // テキストフィールド(UITextField)の設定を自由に行えます
            text.placeholder = "フォルダ名"
            // textField.secureTextEntry = true
        }
         
        */
        
        return alertController
        
    }
    
    
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
