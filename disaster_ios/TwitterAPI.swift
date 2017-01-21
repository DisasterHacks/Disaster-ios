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

struct PersonAPI{
    typealias Parameters = [String:Any?]
}
