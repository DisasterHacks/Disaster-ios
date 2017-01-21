//
//  InternalAPI.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import APIKit

//http://test.core.its-mo.com/zmaps/api/storenaviweb/cgi/store_nearsearch.cgi?cid=lifeline&lat=35.6863167&lon=139.6950472&ewdist=5000&sndist=5000&pos=1&cnt=100&if_clientid=JSZ74a2ce559215|ePej_&if_auth_type=none



protocol ShelterRequest:Request{
    
}

extension ShelterRequest{
    var baseURL:URL{
        return URL(string:"http://153.120.62.197/cruster/shelter.php")!
    }
}

struct ShelterAPI{
    typealias Parameters = [String:Any?]
}

//エンドポイント単位の実装
extension ShelterAPI{
    indirect enum ShelterEnum:ShelterRequest{
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
        
        func response(from object: Any, urlResponse: HTTPURLResponse) throws -> ShelterDatas {
            //return try response(from: object, urlResponse: urlResponse)
            return try! ShelterDatas.decodeValue(object)
        }
    }
}
