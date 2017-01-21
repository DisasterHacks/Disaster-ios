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

class SyncEngine: Realmable {
    
    static let shared = SyncEngine()
    
    private init() {
    }
    
    enum Object {
        case news
        case needs
        case user
        
        func getAll() -> RealmModelable {
            switch self {
            case .news:  return Realm.objects(NewsRealmModel.self) as! RealmModelable
            case .needs: return Realm.objects(NeedsRealmModel.self) as! RealmModelable
            case .user:  return Realm.objects(UserRealmModel.self) as! RealmModelable
            }
        }
    }
}
