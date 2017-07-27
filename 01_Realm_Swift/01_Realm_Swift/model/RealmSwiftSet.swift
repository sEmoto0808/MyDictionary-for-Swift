//
//  RealmSwiftSet.swift
//  01_Realm_Swift
//
//  Created by 江本匠 on 2017/05/27.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import RealmSwift


class Person: Object {
    dynamic var name = ""
    dynamic var age = 0
    dynamic var mood = "Normal"
    dynamic var dog: Dog?  //Dogモデルとの1対1の関連
    let cats = List<Cat>()  //Catモデルとの1対多の関連
    
}

class Animal: Object {
    dynamic var name = ""
    dynamic var age = 0
    
}

class Dog: Animal {
    let persons = LinkingObjects(fromType: Person.self,
                                 property: "dog")  // Personへの逆方向の関連
}

class Cat: Animal {
    let persons = LinkingObjects(fromType: Person.self,
                                 property: "cats")  // Personへの逆方向の関連
}

class UniqueObject: Object {
    dynamic var id = 0
    dynamic var value = ""
    dynamic var optionalValue: String?
    
    override static func primaryKey() -> String? {
        return "id"  // idプロパティをプライマリキーに指定
    }
    
}
