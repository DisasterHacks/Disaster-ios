//
//  Shelter.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import Himotoki

final class Shelter: NSCoding, Decodable {
    
    dynamic var id: String   = ""
    dynamic var name: String = ""
    
    internal func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id,   forKey: "id")
        aCoder.encode(self.name, forKey: "name")
    }
    
    init(id:String,name:String){
        self.id = id
        self.name = name
    }
    
    public required init(coder aDecoder: NSCoder) {
        self.id   = aDecoder.decodeObject(forKey: "id")   as? String ?? ""
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
    }
    
    static func decode(_ e: Extractor) throws -> Shelter {
        return try Shelter(id: e <| "id",name: e <| "name")
    }
}
