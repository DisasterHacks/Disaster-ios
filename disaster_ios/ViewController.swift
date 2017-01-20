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
        himotoki()
        realm()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController{
    func himotoki(){
        /*
        let json: [String: AnyObject] = [ "name": "taro" as AnyObject, "age": 22 as AnyObject ]
        let person: Person? = try? Person.decodeValue(json)
        if( person != nil){
            print("name:\(person!.name) age:\(person!.age)")  //name:taro age:22
        }else{
            print("error")
        }*/
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

}
