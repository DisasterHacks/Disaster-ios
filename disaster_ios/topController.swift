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
    }
    
    func seni(){
        var cont = PublicInfoController()
        //self.present(cont, animated: true, completion: nil)
        
        var viewControllers: [UIViewController] = []
        
        // 1ページ目になるViewController
        let firstVC = PublicInfoController()
        firstVC.tabBarItem = UITabBarItem(title:"災害ニュース",image:nil, tag: 1)
        viewControllers.append(firstVC)
        
        // 2ページ目になるViewController
        let secondVC = MyInfoViewController()
        secondVC.tabBarItem = UITabBarItem(title: "自分の情報", image: nil, tag: 2)
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
