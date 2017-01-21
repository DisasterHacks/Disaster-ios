//
//  shelterHimotoki.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import Himotoki


struct ShelterDatas : Decodable{
    let list:[Shelter]
    
    static func decode(_ e: Extractor) throws -> ShelterDatas {
        return try ShelterDatas(list:e <|| "list")
        //return try She
    }
    
}





