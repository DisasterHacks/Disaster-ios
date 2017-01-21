//
//  RealmModelable.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmModelable {
    var id: String { get set }
}

class RealmModel: Object, RealmModelable {
    dynamic var id = ""
}
