//
//  OperateRealmSwift.swift
//  20170527_skillup
//
//  Created by 江本匠 on 2017/05/27.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift

class OperateRealmSwift: Object {
    
    /*
     * parameter
     * realm: → realmインスタンス
     * object: → 作成したRealmモデルのクラスのインスタンス
     */
    func saveToRealmSwift(realm: Realm, object: Any) {
        try! realm.write {
            realm.add(object as! Object)
        }
    }
    
    /*
     * parameter
     * realm: → realmインスタンス
     * object: → 作成したRealmモデルのクラスのインスタンス（プライマリーキー）
     */
    func saveUniqueObjectToRealmSwift(realm: Realm, uniqueObject: Any) {
        try! realm.write {
            realm.add(uniqueObject as! Object, update: true)
        }
    }
    
    /*
     * parameter
     * realm: → realmインスタンス
     * object: → 作成したRealmモデルのクラス.self
     */
    func selectRealmSwift(realm: Realm, object: Any) -> Results<Object> {
        let results = realm.objects(object as! Object.Type)
        
        print("Result: \(results)")
        
        return results
    }
    
    func deleteRealmSwift(realm: Realm, object: Any) {
        
        try! realm.write {
            realm.delete(object as! Object)
        }
    }
    
    func deleteAllRealmSwift(realm: Realm, object: Any) {
        let results = realm.objects(object as! Object.Type)
        
        try! realm.write {
            realm.delete(results)
        }
    }

}
