//
//  CustomKeyboardViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/17.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class CustomKeyboardViewController: UIViewController {

    @IBOutlet weak var lineTableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var coverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        //タップでキーボードを閉じるジェスチャー登録
        let scViewTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard(_:)))
        coverView.addGestureRecognizer(scViewTapGesture)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*
         * observer設定
         * キーボードを表示する直前 → NSNotification.Name.UIKeyboardWillShow
         * キーボードを非表示にする直前 → NSNotification.Name.UIKeyboardWillHide
         * キーボードを表示した直後 → NSNotification.Name.UIKeyboardDidShow
         */
        let notificationCenter = NotificationCenter.default
        
        // キーボードを表示する直前
        notificationCenter.addObserver(self, selector: #selector(CustomKeyboardViewController.handleKeyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // キーボードを非表示にする直前
        notificationCenter.addObserver(self, selector: #selector(CustomKeyboardViewController.handleKeyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // キーボードを表示した直後
        notificationCenter.addObserver(self, selector: #selector(CustomKeyboardViewController.handleKeyboardDidShowNotification(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    
    
    

}

// MARK: UITextFieldDelegate
extension CustomKeyboardViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
}

// file private
extension CustomKeyboardViewController {
    
    // キーボードを表示する直前の処理
    /*
     * キーボードの高さを取得して、その高さ分textFieldをUIScrollViewで上に移動。
     */
    func handleKeyboardWillShowNotification(_ notification: Notification) {
        
        // キーボードの高さを取得し、テキストフィールドをキーボードの高さ分上に移動する
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset.y = keyboardScreenEndFrame.size.height
        
    }
    
    // キーボードを非表示する直前の処理
    func handleKeyboardWillHideNotification(_ notification: Notification) {
        
        // テキストフィールドを画面の底に移動
        scrollView.contentOffset.y = 0
        
    }
    
    // キーボードを表示した直後の処理
    func handleKeyboardDidShowNotification(_ notification: Notification) {
    }
    
    func hideKeyBoard(_ sender: UITapGestureRecognizer) {
        if textField.isFirstResponder {
            // キーボードを消す
            textField.resignFirstResponder()
        }
    }
    
    // IBAction
    @IBAction func didTapTransmitMessage(_ sender: Any) {
    }
    
}
