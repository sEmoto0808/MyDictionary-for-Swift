//
//  ViewController.swift
//  Optional
//
//  Created by sEmoto on 2017/03/05.
//  Copyright © 2017年 XXXXXXXXXX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str3:String?
        str3 = "test3"
        
        if let strFromOptional2 = str3 {
            print("if let ~の場合\n", strFromOptional2)
        }
        
        let str4:String?
        str4 = "test5"
        
        // nilの場合ここで処理が止まる　→　!と一緒に使うと安全
        guard let strFromOptional3 = str4 else {
            return
        }
        
        print("guard let ~ elseの場合\n", strFromOptional3)
        
        let str5:String = "test5"
        print(str5)
        
        // Optional Chaining
        var str6: String?
        str6 = "test4"
        print(str6?.appending("!!") ?? String())
        
        var aaa: String?
        aaa = nil
        let eee: String?
        eee = nil
        //let bbb: String = aaa! // OK
        //print(bbb)
        print(eee!.appending("!!")) // NG、アプリがクラッシュする
    }

}

