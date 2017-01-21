//
//  Shelter.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation

class Shelter: NSCoding {
    
    var id: String   = ""
    var name: String = ""
    
    internal func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id,   forKey: "id")
        aCoder.encode(self.name, forKey: "name")
    }
    
    public required init(coder aDecoder: NSCoder) {
        self.id   = aDecoder.decodeObject(forKey: "id")   as? String ?? ""
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
    }
}
