//
//  RealmDaoBase.swift
//
//  Created by 江本匠 on 2017/07/29.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import RealmSwift

final class RealmDaoBase <T : RealmSwift.Object> {
    
    let realm: Realm
    
    init() {
        try! realm = Realm()
    }
    
/// MARK: - 新規PrimaryKey発行
    func newId() -> Int? {
        guard let key = T.primaryKey() else {
            //primaryKey未設定
            return nil
        }
        
        let realm = try! Realm()
        return (realm.objects(T.self).max(ofProperty: key) as Int? ?? 0) + 1
    }
    
/// MARK: - レコード取得
    // 全件取得
    func findAll() -> Results<T> {
        return realm.objects(T.self)
    }
    
    // 最初のレコードを取得
    func findFirst() -> T? {
        return findAll().first
    }
    
    // 最後のレコードを取得
    func findLast() -> T? {
        return findAll().last
    }
    
    // 指定したPrimaryKeyのレコードを取得
    func findByKey(key: AnyObject) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: key)
    }
    
/// MARK: - レコード追加
    func add(data: T) {
        do {
            try realm.write {
                realm.add(data)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    // T: RealmSwift.Object で primaryKey()が実装されている時のみ有効
    func update(data: T, block:(() -> Void)? = nil) -> Bool {
        do {
            try realm.write {
                block?()
                realm.add(data, update: true)
            }
            return true
        } catch let error as NSError {
            print(error.description)
        }
        return false
    }
    
/// MARK: - レコード削除
    func delete(data: T) {
        do {
            try realm.write {
                realm.delete(data)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    // レコード全削除
    func deleteAll() {
        let objs = realm.objects(T.self)
        do {
            try realm.write {
                realm.delete(objs)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }
}
