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

/// Mesh Network 上のデータ I/O イベント管理クラス
class MeshEngine: NSObject, MeshEngineable {
    
    // singleton
    static let shared: MeshEngine = MeshEngine()
    
    // peer
    var peerId: MCPeerID = MCPeerID(displayName: UUID.init().uuidString)
    
    var session: MCSession

    private override init() {
        self.session = MCSession(peer: self.peerId, securityIdentity: nil, encryptionPreference: .none)
        super.init()
    }
    
    func send<T: Syncable>(syncable: T) {
        guard let data = syncable.encode() else {
            return
        }
        
        do {
            try self.session.send(data, toPeers: self.session.connectedPeers, with: .reliable)
        } catch {
            print("send error")
        }
    }
}
