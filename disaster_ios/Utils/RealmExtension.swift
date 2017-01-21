//
//  RealmExtension.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation

import RealmSwift

extension Realm {
    class func objects<T: Object>(_ object: T.Type) -> Results<T> {
        let realm = try! Realm()
        return realm.objects(T.self)
    }
    
    class func addObject<T: Object>(_ model: T) {
        let realm = try! Realm()
        try! realm.write({
            realm.add(model, update: true)
        })
    }
    
    class func updateObject<T: Object>(_ model: T) {
        let realm = try! Realm()
        try! realm.write({
            realm.add(model, update: true)
        })
    }
    
    class func deleteObject<T: Object>(_ model: T) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(model)
        }
    }
    
    class func deleteAll<T: Object>(_ type: T.Type) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(realm.objects(type))
        }
    }
}
