//
//  News.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class News: Object, Syncable {
    
    var id: String   = ""
    var text: String = ""
    
    init(text: String) {
        self.text = text
        super.init()
    }
    
    internal func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id,   forKey: "id")
        aCoder.encode(self.text, forKey: "text")
    }
    
    public required init(coder aDecoder: NSCoder) {
        self.id   = aDecoder.decodeObject(forKey: "id")   as? String ?? ""
        self.text = aDecoder.decodeObject(forKey: "text") as? String ?? ""
        super.init()
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}
