//
//  InfoClass.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation


class InfoClass:NSObject{
    var name:String!
    var text:String!
    var date:String!
    var imageUrl:String!
    
    init(name:String!,text:String!) {
        self.name = name
        self.text = text
        self.date = "2017年1月21日"
    }
    
}
