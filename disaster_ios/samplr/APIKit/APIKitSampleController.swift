//
//  APIKitSampleController.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/20.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import APIKit


protocol PersonRequest:Request{
    
}

extension PersonRequest{
    var baseURL:URL{
        return URL(string:"http://153.120.62.197/cruster/person.php")!
    }
}

struct PersonAPI{
    typealias Parameters = [String:Any?]
}


//エンドポイント単位の実装
extension PersonAPI{
     indirect enum PersonEnum:PersonRequest{
        case all()
        case get(id:Int)
        
        var path: String {
            switch self {
            case .all: return "/all"
            case .get(let id): return ""
            }
        }
        var method: HTTPMethod {
            switch self {
            case .all: return .get
            case .get: return .get
            }
        }
        
        var parameters: Any? {
            switch self {
                case .all: return [:]
                case .get: return [:]
            }
        }
        
        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Person {
            //return try response(from: object, urlResponse: urlResponse)
            print("object=>\(object)")
            return try! Person.decodeValue(object)
        }
    }
}
