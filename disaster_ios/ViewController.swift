//
//  ViewController.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/19.
//  Copyright © 2017年 WKC. All rights reserved.
//

import UIKit
import  APIKit
import Himotoki

class ViewController: UIViewController {
    
    let meshManager = MeshEngine.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.meshManager.delegate = self
        self.meshManager.id = UUID.init().uuidString
        self.meshManager.joinMeshNetwork()
    }
    
    @IBAction func send(_ sender: Any) {
        let news = News(id: UUID.init().uuidString, text: "hello world")
        self.meshManager.send(syncable: news)
    }
}


extension ViewController: MeshEngineDelegate {
    
    func didReceived(syncable: Syncable) {
        switch SyncType.init(syncable: syncable) {
        case .news(let news):   print(news.text)
        case .needs(let needs): print(needs.text)
        case .user(let user):   print(user.name)
        case .none(): break
        }
    }
    
    func didConnected(id: String) {
        // 繋がったら Realm からデータを全件取得して、データ別に全送信
    }
}
