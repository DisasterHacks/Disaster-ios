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
    
    
    //DB
    let userdb = userDB()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("きたー！")
        //himotoki()
        //realm()
       // twitter()
        shelter()
        print("ok")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension ViewController{
    
    
    func shelter(){
        let request = ShelterAPI.ShelterEnum.all()
        Session.send(request) { result in
            switch result {
            case .success(let shel):
                print(shel)
                print(shel.list[0].name)
            case .failure(let error): print(error)
            }
        }

        
    }
    func himotoki(){
        let request = PersonAPI.PersonEnum.all()
        Session.send(request) { result in
            switch result {
            case .success(let person): print(person)
            case .failure(let error): print(error)
            }
        }
        
        
        
    }
    
    func realm(){
        userdb.registerUserInfo(name: "kc", age: 200, gender: "boy")
        for (key,val) in userdb.getAllUser(){
            print("\(key)=>\(val)")
        }
    }
    
    
    func twitter(){
        let request = TwitterAPI.TwitterEnum.all()
        Session.send(request) { result in
            switch result {
            case .success(let twitter): print(twitter)
            case .failure(let error): print(error)
            }
        }
    }
}
