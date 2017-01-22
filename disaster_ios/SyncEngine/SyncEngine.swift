//
//  SyncEngine.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

protocol Realmable {
}

extension Realmable {
    
    typealias Handler = () -> Void
    
    func add<T: RealmModel>(_ object: T, handler: @escaping Handler) {
        Realm.addObject(object)
    }
    
    func update<T: RealmModel>(_ object: T, handler: @escaping Handler) {
        Realm.updateObject(object)
    }
    
    func delete<T: RealmModel>(_ object: T, handler: @escaping Handler) {
        Realm.deleteObject(object)
    }
}

class SyncEngine {
    
    static let shared = SyncEngine()
    
    private init() {
    }
    
    typealias Handler = () -> Void
    
    func add(_ object: NewsRealmModel, handler: @escaping Handler) {
        guard let news = self.newsAll().filter("id=%@", object.id).first else {
            // 重複無し
            Realm.addObject(object)
            return
        }
        
        Realm.deleteObject(news)
        Realm.addObject(object)
    }
    
    func add(_ object: NeedsRealmModel, handler: @escaping Handler) {
        guard let needs = self.needsAll().filter("id=%@", object.id).first else {
            // 重複無し
            Realm.addObject(object)
            return
        }
        
        Realm.deleteObject(needs)
        Realm.addObject(object)
    }
    
    func add(_ object: UserRealmModel, handler: @escaping Handler) {
        guard let user = self.userAll().filter("id=%@", object.id).first else {
            // 重複無し
            Realm.addObject(object)
            return
        }
        
        Realm.deleteObject(user)
        Realm.addObject(object)
    }
    
    func add(_ object: ShelterRealmModel, handler: @escaping Handler) {
        guard let shelter = self.shelterAll().filter("id=%@", object.id).first else {
            // 重複無し
            Realm.addObject(object)
            return
        }
        
        Realm.deleteObject(shelter)
        Realm.addObject(object)
    }
    
    func update<T: RealmModel>(_ object: T, handler: @escaping Handler) {
        Realm.updateObject(object)
    }
    
    func delete<T: RealmModel>(_ object: T, handler: @escaping Handler) {
        Realm.deleteObject(object)
    }
    
    func newsAll() -> Results<NewsRealmModel> {
        return Realm.objects(NewsRealmModel.self)
    }
    
    func needsAll() -> Results<NeedsRealmModel> {
        return Realm.objects(NeedsRealmModel.self)
    }
    
    func userAll() -> Results<UserRealmModel> {
        return Realm.objects(UserRealmModel.self)
    }
    
    func shelterAll() -> Results<ShelterRealmModel> {
        return Realm.objects(ShelterRealmModel.self)
    }
    
    func user(by id: String) -> Results<UserRealmModel> {
        return Realm.objects(UserRealmModel.self).filter("id=%@", id)
    }
    
    func userByName(name: String) -> Results<UserRealmModel> {
        return Realm.objects(UserRealmModel.self).filter("name=%@", name)
    }
    
    func shelter(id: String) -> Results<ShelterRealmModel> {
        return Realm.objects(ShelterRealmModel.self).filter("id=%@", id)
    }
    
    func shelterByName(name: String) -> Results<ShelterRealmModel> {
        return Realm.objects(ShelterRealmModel.self).filter("name=%@", name)
    }
}
