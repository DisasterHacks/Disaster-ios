//
//  TwitterHimotoki.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import Himotoki

struct TwitterData : Decodable{
    let name:String
    let list:[String]
    
    static func decode(_ e: Extractor) throws -> TwitterData {
        return try TwitterData(name: e <| "name",list:e <|| "list")
    }
    
}
