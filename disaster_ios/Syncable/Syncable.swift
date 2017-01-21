//
//  Syncable.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation

protocol Syncable: NSCoding {
    var id: String { get }
    func encode() -> Data?
    func decode(data: Data) -> Syncable?
}

extension Syncable {
    
    func decode(data: Data) -> Syncable? {
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? Syncable
    }
    
    func encode() -> Data? {
        return NSKeyedArchiver.archivedData(withRootObject: self)
    }
}
