//
//  MeshEngine.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import MultipeerConnectivity

protocol MeshEngineable: class {
    var peerId: MCPeerID { get set }
    func send<T: Syncable>(syncable: T)
}
