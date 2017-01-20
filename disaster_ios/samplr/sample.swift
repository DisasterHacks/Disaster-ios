//
//  sample.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/20.
//  Copyright © 2017年 WKC. All rights reserved.
//
/*
import Foundation

import APIKit

import Himotoki

struct Landmarks: Decodable {
    
    let results: [Landmark]
    
    /// - Throws: DecodeError or an arbitrary ErrorType
    public static func decode(_ e: Extractor) throws -> Landmarks {
        return try Landmarks(
            results: e <|| "results"
        )
    }
}

struct Landmark: Decodable {
    
    let name: String?
    let id: String?
    let address: String?
    
    /// - Throws: DecodeError or an arbitrary ErrorType
    public static func decode(_ e: Extractor) throws -> Landmark {
        return try Landmark(
            name:    e <|? "name",
            id:      e <|? "place_id",
            address: e <|? "vicinity"
        )
    }
}


import APIKit

protocol LandmarkRequestable: Request {
}

extension LandmarkRequestable {
    var baseURL: URL {
        return URL(string: "https://maps.googleapis.com")!
    }
}


//次にエンドポイント用のプロトコルを定義。(複数の API を試していたので、複数のエンドポイントでも拡張しやすいよう)

import APIKit

protocol LandmarkApiEndpointable {
    associatedtype Response
    static var method: HTTPMethod { get }
    static var path: String { get }
    static func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response
}

// エンドポイントを LandmarkApiEndpointable に準拠させて定義。
class GetLandmark: LandmarkApiEndpointable {
    
    typealias Response            = Landmarks
    static var method: HTTPMethod = .get
    static var path: String       = "/maps/api/place/search/json"
    
    static func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response.decodeValue(object)
    }
    
}

// 最後に Api を LandmarkRequestable プロトコルに準拠させて定義。LandmarkApiEndpointable プロトコルに準拠した型で生成することで、where で型ごとにメソッドを定義して、生成時のイニシャライザを切り分ける
struct LandmarkApi<T: LandmarkApiEndpointable>: LandmarkRequestable {
    
    typealias Response = T.Response
    var method: HTTPMethod {
        return T.method
    }
    
    var path: String {
        return T.path
    }
    
    var parameters: Any?
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> T.Response {
        return try T.response(from: object, urlResponse: urlResponse)
    }
}*/
/*
extension LandmarkApi where T: GetLandmark {
    
    init(visitCluster: VisitClusterModel) { // VisitClusterModel は 滞在情報モデル
        self.parameters = [
            "location": "\(visitCluster.coordinate.latitude),\(visitCluster.coordinate.longitude)",
            "radius":   LandmarkUtils.radius,
            "types":    LandmarkUtils.Types.all(),
            "language": LandmarkUtils.language,
            "sensor":   LandmarkUtils.sensor,
            "key":      GlobalConstant.Google.apiKey
        ]
    }
}

let api = LandmarkApi<GetLandmark>(visitCluster: model)
Session.send(api) {
    switch $0 {
    case .success(let response):
    case .failure(let error):
    }
}*/


