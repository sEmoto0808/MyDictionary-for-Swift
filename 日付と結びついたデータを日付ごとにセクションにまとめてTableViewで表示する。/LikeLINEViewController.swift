//
//  LikeLINEViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/17.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift

class LikeLINEViewController: UIViewController {
    
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
    
    // row data
    //var messageSetItems = [Object]()
    var messageLists = [String]()
    var dateLists = [String]()
    var timeLists = [String]()
    var dataSet = [[String]]()
    
    var arrangedData = [[String]]()
    
    var dateCheckArray = [String]()
    var sectionItems = [[[String]]]()
    var cellNums = [Int]()
    
    var messageResult: Results<Object>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
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
        notificationCenter.addObserver(self, selector: #selector(LikeLINEViewController.handleKeyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // キーボードを非表示にする直前
        notificationCenter.addObserver(self, selector: #selector(LikeLINEViewController.handleKeyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        // キーボードを表示した直後
        notificationCenter.addObserver(self, selector: #selector(LikeLINEViewController.handleKeyboardDidShowNotification(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }

}

// MARK: UITextFieldDelegate
extension LikeLINEViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
}

// MARK: UITableViewDataSource
extension LikeLINEViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return dateCheckArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellNums[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LINECell", for: indexPath as IndexPath) as! LikeLINETableViewCell
        
        cell.setUserMessage(userMessageString: sectionItems[indexPath.section][indexPath.row][0])
        cell.setTransmitTime(transmitTimeString: sectionItems[indexPath.section][indexPath.row][2])
        
        return cell
    }
}

extension LikeLINEViewController: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     
     // セクションに表示するテキストを返す
     return dateCheckArray[section]
     }
    
}

// file private
extension LikeLINEViewController {
    
    func setup() {
        Realm.Configuration.defaultConfiguration = config
        
        lineTableView.estimatedRowHeight = 82
        lineTableView.rowHeight = UITableViewAutomaticDimension
        
        // セルの線を消す
        //lineTableView.tableFooterView = UIView(frame: .zero)
        
        //タップでキーボードを閉じるジェスチャー登録
        let scViewTapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard(_:)))
        self.view.addGestureRecognizer(scViewTapGesture)
    }
    
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
        
        lineTableView.reloadData()
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
    
    func saveRealm(realm: Realm, message: String, date: String, time: String) {
        let messageSet = UserMessage(value: ["message": message,
                                             "date": date,
                                             "time": time])
        let uniqueObj = UniqueObject(value: ["messageId": 0])
        
        OperateRealmSwift().saveToRealmSwift(realm: realm, object: messageSet)
        OperateRealmSwift().saveUniqueObjectToRealmSwift(realm: realm, uniqueObject: uniqueObj)
    }
    
    func setItemsFromRealm(realm: Realm) {
        messageResult = OperateRealmSwift().selectRealmSwift(realm: realm, object: UserMessage.self)
        
        guard let result = messageResult else {
            return
        }
        for i in 0..<result.count {
            messageLists.append(result[i]["message"] as! String)
            dateLists.append(result[i]["date"] as! String)
            timeLists.append(result[i]["time"] as! String)
        }
        
        dateCheckArray = removeSameDate(dateLists: dateLists)
        print("\n\n\ndateCheckArray: \(dateCheckArray)")
        
        let int = messageLists.count
        let array = Array(repeating: "", count: 3)
        dataSet = Array(repeating: array, count: int)
        
        for i in 0..<int {
            dataSet[i][0].append(messageLists[i])
            dataSet[i][1] = dateLists[i]
            dataSet[i][2] = timeLists[i]
        }
        
        var countData = [[String]]()
        cellNums.removeAll()
        sectionItems.removeAll()
        for i in 0..<dateCheckArray.count {
            let text = dateCheckArray[i]
            print("text\(i): \(text)")
            
            for data in dataSet {
            
                if data[1].contains(text) {
                    countData.append(data)
                }
            }
            cellNums.append(countData.count)
            sectionItems.append(countData)
            countData.removeAll()
        }
        
    }
    
    func getDate() -> String {
        let now = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let dateStr = formatter.string(from: now)
        
        return dateStr
    }
    
    func getTime() -> String {
        let now = Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let timeStr = formatter.string(from: now)
        
        return timeStr
    }
    
    func removeSameDate(dateLists: Array<String>) -> Array<String> {
        
        let orderedSet = NSOrderedSet(array: dateLists)
        let uniqueDates = orderedSet.array as! [String]
        
        return uniqueDates
    }
    
    // IBAction
    @IBAction func didTapTransmitMessage(_ sender: Any) {
        
        messageLists.removeAll()
        dateLists.removeAll()
        timeLists.removeAll()
        
        let dateStr = getDate()
        let timeStr = getTime()
        
        guard let userText = textView.text else {
            return
        }
        
        guard let messageRealm = realm else {
            return
        }
        
        saveRealm(realm: messageRealm, message: userText, date: dateStr, time: timeStr)
        setItemsFromRealm(realm: messageRealm)
        
        textView.resignFirstResponder()
        
        lineTableView.reloadData()
    }
    
}
