//
//  TwitterAPI.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import APIKit

//url = http://153.120.62.197/cruster/twitterData.php


protocol TwitterRequest:Request{
    
}

extension TwitterRequest{
    var baseURL:URL{
        return URL(string:"http://153.120.62.197/cruster/twitterData.php")!
    }
}

struct TwitterAPI{
    typealias Parameters = [String:Any?]
}

//エンドポイント単位の実装
extension TwitterAPI{
    indirect enum TwitterEnum:TwitterRequest{
        case all()
        case get(id:Int)
        
        var path: String {
            switch self {
            case .all: return ""
            case .get(let id): return "/get"
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
        
        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> TwitterData {
            //return try response(from: object, urlResponse: urlResponse)
            print("object=>\(object)")
            return try! TwitterData.decodeValue(object)
        }
    }
}
