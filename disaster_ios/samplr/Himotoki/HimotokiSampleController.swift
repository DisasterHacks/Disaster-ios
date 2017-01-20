//
//  HimotokiSampleController.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/20.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import Himotoki

struct Person : Decodable{
    let name:String
    let age:Int
    
    static func decode(_ e: Extractor) throws -> Person {
        return try Person(name: e <| "name", age: e <| "age")
    }
    
}

