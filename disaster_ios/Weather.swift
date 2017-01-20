//
//  Weather.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/20.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import APIKit
import Himotoki
/*
struct WeatherDatas :Decodable{
    let datas:WeatherData
    public static func decode(_ e: Extractor) throws -> WeatherDatas {
        return try WeatherDatas(
            datas: (e <|? "forecasts")!
        )
    }

}

struct WeatherData:Decodable{
    let telop:String?
    let dataLabel:String?
    public static func decode(_ e: Extractor) throws -> WeatherData {
        return try WeatherData(
            telop: e <|? "telop",
            dataLabel: e <|? "dataLabel")
    }

    
}


protocol WeatherRequestType : Request {
    
}

extension WeatherRequestType {
    var baseURL:URL {
        return NSURL(string: "http://weather.livedoor.com/forecast/webservice/json")! as URL
    }
}

protocol WeatherDataEndpointable{
    associatedtype Response
    static var method: HTTPMethod { get }
    static var path: String { get }
    static func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response
}


class GetWeatherData: WeatherDataEndpointable {
    
    typealias Response            = WeatherDatas
    static var method: HTTPMethod = .get
    static var path: String       = "/v1"
    
    static func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response.decodeValue(object)
    }
    
}


//最終的なアクセス用クラス
struct GetWeatherRequest: WeatherRequestType {
    // 成功時の値をWeatherData型で返す
    typealias Response = WeatherData
    
    var baseURL: URL!
    
    // メソッドはGET
    var method: HTTPMethod {
        return .get
    }
    
    // リソース
    var path: String {
        return "/v1"
    }
    // 付加するパラメータ（オプション）
    var parameters:Any?
        /*[String: AnyObject] {
        return [
            "city": "016010" as AnyObject,
        ]
    }*/
    // 受信完了時のデコード処理
    func response(object: Any, URLResponse: HTTPURLResponse) -> Response? {
    }
    
    
}*/
