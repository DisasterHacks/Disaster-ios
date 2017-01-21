//
//  MeshEngine.swift
//  disaster_ios
//
//  Created by 三宅　篤史 on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import MultipeerConnectivity

protocol MeshEngineDelegate {
    func willSend(syncable: Syncable)
    func didSent(syncable: Syncable)
    func didReceived(syncable: Syncable)
    func didConnected(id: String)
}

extension MeshEngineDelegate {
    func willSend(syncable: Syncable) { }
    func didSent(syncable: Syncable) { }
    func didConnected(id: String) { }
}

protocol MeshEngineable: class {
    var peerId: MCPeerID { get set }
    func send<T: Syncable>(syncable: T)
}

/// Mesh Network 上のデータ I/O イベント管理クラス
class MeshEngine: NSObject, MeshEngineable {
    
    // singleton
    static let shared: MeshEngine = MeshEngine()
    
    // service name
    var serviceName: String = "MeshKit" {
        didSet {
            self.joinMeshNetwork()
        }
    }
    
    var id: String {
        set(newValue) {
            self.peerId = MCPeerID(displayName: newValue)
        }
        get {
            return self.peerId.displayName
        }
    }
    
    // peer
    var peerId: MCPeerID = MCPeerID(displayName: UUID.init().uuidString)
    
    var session: MCSession
    var nearByBrowser:   MCNearbyServiceBrowser!
    var nearByAdveriser: MCNearbyServiceAdvertiser!

    // delegate
    var delegate: MeshEngineDelegate! = nil
    
    private override init() {
        self.session = MCSession(peer: self.peerId, securityIdentity: nil, encryptionPreference: .none)
        super.init()
    }
    
    func joinMeshNetwork() {
        self.startSearchConnectionUser()
        self.startAdvertisingPeer()
    }
    
    // peripheral
    func startSearchConnectionUser() {
        self.nearByBrowser          = MCNearbyServiceBrowser(peer: self.peerId, serviceType: self.serviceName)
        self.nearByBrowser.delegate = self
        self.nearByBrowser.startBrowsingForPeers()
    }
    
    // central
    func startAdvertisingPeer() {
        self.nearByAdveriser          = MCNearbyServiceAdvertiser(peer: self.peerId, discoveryInfo: nil, serviceType: self.serviceName)
        self.nearByAdveriser.delegate = self
        self.nearByAdveriser.startAdvertisingPeer()
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

extension MeshEngine: MCNearbyServiceBrowserDelegate {
    // peer lost
    public func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("lost peer is \(peerID.displayName)")
    }
    
    // automatic connection
    public func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 0)
    }
}

extension MeshEngine: MCNearbyServiceAdvertiserDelegate {
    // allow automatic connection
    public func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, self.session)
    }
}

extension MeshEngine: MCSessionDelegate {
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            self.delegate.didConnected(id: peerID.displayName)
            print("繋がったら、Realm から全件取得してデータのタイプに応じて接続ユーザに対して全送信")
        case .connecting: break
        case .notConnected: break
        }
    }
    
    // received
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        // decode
        guard let syncable = NSKeyedUnarchiver.unarchiveObject(with: data) as? Syncable else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else {
                return
            }
            
            `self`.delegate.didReceived(syncable: syncable)
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) { }
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) { }
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) { }
}
