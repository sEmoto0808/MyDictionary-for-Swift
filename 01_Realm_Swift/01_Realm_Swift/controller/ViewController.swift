//
//  ViewController.swift
//  01_Realm_Swift
//
//  Created by 江本匠 on 2017/05/27.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    let config = Realm.Configuration(
        schemaVersion: 1,
        migrationBlock: { migration, oldSchemaVersion in
            if (oldSchemaVersion < 1) {}
    })
    
    var realm:Realm?
    
    var person = Person()
    
    @IBOutlet weak var userName: UITextField!

    @IBOutlet weak var userContents: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userName.delegate = self
        self.userContents.delegate = self
        
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
        
        /*
        // 生成後に初期化
        let dog = Dog()  // Dogモデルオブジェクトの生成
        dog.name = "Hachi"
        dog.age = 1
        
        let cat1 = Cat(value: ["name": "Momo",
                               "age": 0])
        let cat2 = Cat(value: ["name": "Toto",
                               "age": 2])
        
        let person = Person(value: ["name": "Taro",
                                    "age": 24,
                                    "dog": dog,
                                    "cat": [cat1, cat2]])
        */
        
        /*
        // Dogモデルオブジェクトを生成してDictionaryで初期化
        let dog = Dog(value: ["name": "Hachi",
                              "age": 1])
        */
        
        /*
        // Dogモデルオブジェクトを生成して各プロパティ値を含む配列で初期化
        let dog = Dog(value: ["Hachi", 1])
        */
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        self.userName.resignFirstResponder()
        
        return true
    }
    

    @IBAction func saveToDB(_ sender: Any) {
        
//        let personName: String = self.userName.text!
//        
//        let person = Person(value: ["name": personName,
//                                    "age": 24])
        let personAge = Int.random(range: 10..<20)
        let catAge = Int.random(range: 0..<4)
        
        
        person = Person(value: ["name": "Yu",
                                    "age": personAge])
        try! realm?.write {
            realm?.add(person)
        }
        
        let cat = Cat(value: ["name": "ToTo",
                              "age": catAge])
        
        try! realm?.write {
            person.cats.append(cat)
            
        }
        
        print("person.cats: \(person.cats)")
    }
    
    @IBAction func checkResult(_ sender: Any) {
        let result = realm?.objects(Person.self)
        
        print("Result: \(String(describing: result?.count))人\n")
        print("Result: \(String(describing: result))\n")
        
    }
    
    @IBAction func update(_ sender: Any) {
        
//        let result = realm?.objects(Person.self)
//        
//        let int: Int = 1
//        
//        try! realm?.write {
//            result?[int]["name"] = "Jiro"
//            //realm.add(person)
//            
//        }
//        let cat = Cat(value: ["name": "ToTo",
//                              "age": 11])
//        
//        try! realm?.write {
//            person.cats.append(cat)
//            
//        }
//        
//        print("person.cats: \(person.cats)")
    }
    
    
    @IBAction func deleteData(_ sender: Any) {
        
        let result = realm?.objects(Person.self)
        
        try! realm?.write {
            realm?.delete((result?[0])!)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

