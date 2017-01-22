//
//  userInfo.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation

class UserInfo:NSObject{
    var name:String!
    var text:String!
    var id:String!
    var date:String!
    
    init(id:String!,name:String!,text:String!){
        self.id = id
        self.name = name
        self.text = text
    }
}
