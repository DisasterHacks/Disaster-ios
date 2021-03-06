//
//  Needs.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Needs: NSObject, Syncable {
    
    var id: String      = ""
    var text: String    = ""
    var userId: String  = ""
    var timestamp: Date = Date()
    
    init(id: String, text: String, userId: String) {
        self.id     = id
        self.text   = text
        self.userId = userId
        super.init()
    }
    
    internal func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id,        forKey: "id")
        aCoder.encode(self.userId,    forKey: "userId")
        aCoder.encode(self.text,      forKey: "text")
        aCoder.encode(self.timestamp, forKey: "timestamp")
    }
    
    public required init(coder aDecoder: NSCoder) {
        self.id     = aDecoder.decodeObject(forKey: "id")     as? String ?? ""
        self.userId = aDecoder.decodeObject(forKey: "userId") as? String ?? ""
        self.text   = aDecoder.decodeObject(forKey: "text")   as? String ?? ""
        super.init()
    }
}
