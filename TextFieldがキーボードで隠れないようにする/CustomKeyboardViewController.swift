//
//  CustomKeyboardViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/17.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift

class CustomKeyboardViewController: UIViewController {
    
    let config = Realm.Configuration(
        schemaVersion: 1,
        migrationBlock: { migration, oldSchemaVersion in
            if (oldSchemaVersion < 1) {}
    })
    
    var realm: Realm?

    @IBOutlet weak var lineTableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var messageBarBottom: NSLayoutConstraint!
    
    var items = [String]()
    var messageResult: Results<Object>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // セルの線を消す
        lineTableView.tableFooterView = UIView(frame: .zero)
        
        //タップでキーボードを閉じるジェスチャー登録
        
        let scViewTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard(_:)))
        self.view.addGestureRecognizer(scViewTapGesture)
        
        realm = try! Realm()
        
        guard let messageRealm = realm else {
            return
        }
        setItemsFromRealm(realm: messageRealm)

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

// MARK: UITableViewDataSource
extension CustomKeyboardViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LINECell", for: indexPath as IndexPath) as! CustomKeyboardTableViewCell
        
        cell.setUserMessage(userMessageString: items[indexPath.section])
        //cell.layer.cornerRadius = 30.0
        //cell.layer.masksToBounds = true
        
        return cell
    }
}

extension CustomKeyboardViewController: UITableViewDelegate {
    
    /*
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     
     // セクションに表示するテキストを返す
     return "クーポン名"
     }
     */
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        // セルの上部のスペース
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        // セルの下部のスペース
        return 20
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        // 透明にすることでスペースとする
        view.tintColor = UIColor.clear
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        
        // 透明にすることでスペースとする
        view.tintColor = UIColor.clear
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
        messageBarBottom.constant = keyboardScreenEndFrame.size.height
        
    }
    
    // キーボードを非表示する直前の処理
    func handleKeyboardWillHideNotification(_ notification: Notification) {
        
        // テキストフィールドを画面の底に移動
        messageBarBottom.constant = 0
        
    }
    
    // キーボードを表示した直後の処理
    func handleKeyboardDidShowNotification(_ notification: Notification) {
    }
    
    func hideKeyBoard(_ sender: UITapGestureRecognizer) {
        if textView.isFirstResponder {
            // キーボードを消す
            textView.resignFirstResponder()
        }
    }
    
    func saveRealm(realm: Realm, message: String) {
        let messageFromUser = UserMessage(value: ["message": message])
        let uniqueObj = UniqueObject(value: ["messageId": 0])
        
        OperateRealmSwift().saveToRealmSwift(realm: realm, object: messageFromUser)
        OperateRealmSwift().saveUniqueObjectToRealmSwift(realm: realm, uniqueObject: uniqueObj)
    }
    
    func setItemsFromRealm(realm: Realm) {
        messageResult = OperateRealmSwift().selectRealmSwift(realm: realm, object: UserMessage.self)
        
        var int = 0
        guard let result = messageResult else {
            return
        }
        int = result.count
        for i in 0..<int {
            items.append(result[i]["message"] as! String)
        }
    }
    
    // IBAction
    @IBAction func didTapTransmitMessage(_ sender: Any) {
        
        items.removeAll()
        
        guard let userText = textView.text else {
            return
        }
        
        guard let messageRealm = realm else {
            return
        }
        
        saveRealm(realm: messageRealm, message: userText)
        
        setItemsFromRealm(realm: messageRealm)
        
        textView.resignFirstResponder()
        
        lineTableView.reloadData()
    }
    
}
