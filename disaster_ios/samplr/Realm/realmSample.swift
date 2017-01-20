//
//  realmSample.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/20.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import RealmSwift

class userDB:Object{
    static let realm = try! Realm()
    dynamic var id:Int = 0
    dynamic var name:String = ""
    dynamic var age:Int = 0
    dynamic var gender:String = ""
    
    override class func primaryKey() -> String{
        return "id"
    }

    func registerUserInfo(name:String,age:Int,gender:String){
        let user = userDB()
        user.id = getLastId()
        user.id = user.id + 1
        user.name = name
        user.age = age
        user.gender = gender
        try! userDB.realm.write {
            userDB.realm.add(user)
        }
    }
    
    func getAllUser()->Dictionary<Int,userDB>{
        let allUsers = userDB.realm.objects(userDB)
        var ret: [Int:userDB] = [:]
        for ind in 0..<allUsers.count{
            ret[ind] = allUsers[ind]
        }
        
        return ret
    }
    
    func getUserByName(name:String)->userDB{
        let res = userDB.realm.objects(userDB).filter("name==%@",name).first
        return res!
        
    }
    
    
    // autoIncrement実現のためのID複製
    
    private func getLastId()->Int{
        let lasId:Int!
        if(getAllUser().count != 0){
            lasId = userDB.realm.objects(userDB.self).sorted(byProperty: "id", ascending: true).last?.id
        }else{
            lasId = 0
        }
        return lasId!
    }

}


