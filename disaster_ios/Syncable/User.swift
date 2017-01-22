//
//  User.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class User: NSObject, Syncable {
    
    var id: String   = ""
    var name: String = ""
    
    init(id: String, name: String) {
        self.id   = id
        self.name = name
        super.init()
    }
    
    internal func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id,   forKey: "id")
        aCoder.encode(self.name, forKey: "text")
    }
    
    public required init(coder aDecoder: NSCoder) {
        self.id   = aDecoder.decodeObject(forKey: "id")   as? String ?? ""
        self.name = aDecoder.decodeObject(forKey: "text") as? String ?? ""
        super.init()
    }
}
