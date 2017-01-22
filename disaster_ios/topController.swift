//
//  topController.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import UIKit

class topController: UIViewController {
    
    var imageView:UIImageView!
    let meshManager = MeshEngine.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView = UIImageView(frame:self.view.bounds)
        imageView.image = UIImage(named:"top.png")
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(imageView)
        /*
        var nextButton = UIButton(frame:CGRect(x:100,y:250,width:self.view.frame.size.width/2,height:80))
        nextButton.title(for: .normal) = "次へ進む"
        nextButton.backgroundColor = UIColor.white
        nextButton.corner
        nextButton.addTarget(self, action: "seni", for: .touchUpInside)*/
        
        self.meshManager.delegate = self
        self.meshManager.id = UUID.init().uuidString
        self.meshManager.joinMeshNetwork()
    }
    
    func seni(){
        var cont = PublicInfoController()
        //self.present(cont, animated: true, completion: nil)
        
        var viewControllers: [UIViewController] = []
        
        // 1ページ目になるViewController
        let firstVC = PublicInfoController()
        firstVC.tabBarItem = UITabBarItem(title:"災害ニュース",image:nil, tag: 1)
        viewControllers.append(firstVC)
        
        //2ページ目
        let community = hinanSiteiController()
        community.tabBarItem =  UITabBarItem(title: "避難所コミュニティ", image: nil, tag: 2)

        
        //3ページ目になるViewController
        let secondVC = MyInfoViewController()
        secondVC.tabBarItem = UITabBarItem(title: "自分の情報", image: nil, tag: 3)
        viewControllers.append(secondVC)
       
        
        
        
        // ページをセット
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(viewControllers, animated: false)
        self.present(tabBarController, animated: true, completion: nil)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.seni()
    }
    
}

extension topController: MeshEngineDelegate {
    
    func didReceived(syncable: Syncable) {
        switch SyncType.init(syncable: syncable) {
        case .news(let news):   SyncEngine.shared.add(NewsRealmModel(news:   news))  {}
        case .needs(let needs): SyncEngine.shared.add(NeedsRealmModel(needs: needs)) {}
        case .user(let user):   SyncEngine.shared.add(UserRealmModel(user:   user))  {}
        case .none(): break
        }
    }
    
    func didConnected(id: String) {
        SyncEngine.shared.newsAll().forEach {
            let news = News(id: $0.id, text: $0.text)
            self.meshManager.send(syncable: news)
        }
        
        SyncEngine.shared.needsAll().forEach {
            let needs = Needs(id: $0.id, text: $0.text)
            self.meshManager.send(syncable: needs)
        }
        
        SyncEngine.shared.userAll().forEach {
            let user = User(id: $0.id, name: $0.name)
            self.meshManager.send(syncable: user)
        }
    }
}

enum SyncType {
    case news(News)
    case needs(Needs)
    case user(User)
    case none()
    init(syncable: Syncable) {
        if syncable is News {
            self = .news(syncable as! News)
            return
        }
        
        if syncable is Needs {
            self = .needs(syncable as! Needs)
            return
        }
        
        if syncable is User {
            self = .user(syncable as! User)
            return
        }
        
        self = .none()
    }
}
