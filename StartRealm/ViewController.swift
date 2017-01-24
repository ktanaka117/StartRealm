//
//  ViewController.swift
//  StartRealm
//
//  Created by 田中賢治 on 2017/01/23.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        // オブジェクトの生成
        let tanaka = Person()
        tanaka.name = "田中"
        tanaka.age  = 23
        tanaka.sex  = "MALE"
        
        
        // 書き込み
        try! realm.write() {
            realm.add(tanaka)
        }
        
        
        // 読み込み
        print(realm.objects(Person.self))
        print(realm.objects(Person.self).filter("age >= 20"))
        print(realm.objects(Person.self).filter("sex like 'MALE'"))
        print(realm.objects(Person.self).filter("sex contains '田中'"))
        
        
        // 更新
        if let firstPerson = realm.objects(Person.self).first {
            try! realm.write() {
                firstPerson.name = "西木野"
            }
        }
        
        
        // 削除
        if let firstPerson = realm.objects(Person.self).first {
            try! realm.write() {
                realm.delete(firstPerson)
            }
        }
    }

}

class Person: Object {
    dynamic var name         = ""
    dynamic var age          = 0
    dynamic var sex          = ""
}
