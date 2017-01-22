//
//  hinanSiteiController.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation

import UIKit


class hinanSiteiController: UIViewController, UISearchBarDelegate,UITextFieldDelegate  {
    
    var tmpText:String = ""
    var mySearchBar:UISearchBar! = nil
    var explainText:UITextView!
    var sisetuName : UITextField!
    var adName:UITextField!
    
    var userDB = UserRealmModel()
    
    var registerButton:UIButton!
    
    var shelterList = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHinan()
        
        self.view.backgroundColor = UIColor.white
        
        let topLabel = UILabel(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:50))
        topLabel.text = "避難所を指定"
        topLabel.font = UIFont.systemFont(ofSize: 14.0)
        
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self //UISearchBarDelegate
        mySearchBar.frame = CGRect(x:0, y:50, width:self.view.frame.size.width, height:50)
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 50)
        mySearchBar.showsCancelButton = true
        mySearchBar.placeholder = "避難所を入力して下さい"
        self.view.addSubview(mySearchBar)
        
        
        setUnderView()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    func setHinan(){
        let list = SyncEngine.shared.userAll()
        
        for i in list{
            shelterList[i.shelterId] = i.name
            print("\(i.shelterId)=>\(i.name)")

        }
        
    }
    func setUnderView(){
        //説明テキスト
        explainText = UITextView(frame:CGRect(x:0,y:100,width:self.view.frame.size.width,height:50))
        explainText.text = "避難所情報を入力してください。"
        self.view.addSubview(explainText)

            //s位説明
            let sisetuView = UIView(frame:CGRect(x:00,y:150,width:self.view.frame.size.width,height:50))
            sisetuView.layer.borderWidth = 0.5
            sisetuView.layer.borderColor = UIColorFromRGB(0xe3e3e3).cgColor
            let nameLabel = UILabel(frame:CGRect(x:20,y:150,width:self.view.frame.size.width,height:50))
            nameLabel.text = "避難所名"
            nameLabel.textColor = UIColorFromRGB(0xAAAAAA)
            nameLabel.font = UIFont(name: "HiraginoSans-W6", size: 14)
            sisetuName = UITextField(frame:CGRect(x:80,y:150,width:self.view.frame.size.width,height:50))
            sisetuName.textColor = UIColorFromRGB(0x15AFEF)
            self.view.addSubview(sisetuView)
            self.view.addSubview(nameLabel)
            self.view.addSubview(sisetuName)
        
        //住所
        let adView = UIView(frame:CGRect(x:00,y:200,width:self.view.frame.size.width,height:50))
        adView.layer.borderWidth = 0.5
        adView.layer.borderColor = UIColorFromRGB(0xe3e3e3).cgColor
        let adLabel = UILabel(frame:CGRect(x:20,y:200,width:self.view.frame.size.width,height:50))
        adLabel.text = "住所"
        adLabel.textColor = UIColorFromRGB(0xAAAAAA)
        adLabel.font = UIFont(name: "HiraginoSans-W6", size: 14)
        adName = UITextField(frame:CGRect(x:80,y:200,width:self.view.frame.size.width,height:50))
        adName.textColor = UIColorFromRGB(0x15AFEF)
        adName.delegate = self
        self.view.addSubview(adView)
        self.view.addSubview(adLabel)
        self.view.addSubview(adName)
        
        //登録ボタン
        registerButton = UIButton(frame:CGRect(x: 0,y: self.adName.frame.origin.y + self.adName.frame.size.height + 20,width:74,height:35))
        registerButton.center = CGPoint(x: self.view.center.x, y: registerButton.center.y)
        registerButton.setTitle("登録", for: .normal)
        registerButton.addTarget(self, action: "register", for: .touchUpInside)
        registerButton.setImage(UIImage(named:"userself.png"),for:.normal)
        self.view.addSubview(registerButton)
    }
    
    func register(){
        //realmで自分の避難場所を登録する
        let user = UserRealmModel()
        user.name = sisetuName.text!
        user.shelterId = ""
        SyncEngine.shared.add(user) {
        }
        //print(SyncEngine.shared.userAll())
        self.dismiss(animated: true, completion: nil)
    }

 }

extension hinanSiteiController{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      //  myLabel.text = searchText
        tmpText = searchText
    }
    
    /*
     Cancelボタンが押された時に呼ばれる
     */
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       // myLabel.text = ""
        mySearchBar.text = ""
    }
    
    /*
     Searchボタンが押された時に呼ばれる
     */
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        mySearchBar.text = ""
        self.view.endEditing(true)
        setSisetuText()
    }
    
    func setSisetuText(){
        //realmで検索してラベル更新
        let realmFlg = false
        if(!realmFlg){
            self.explainText.text = "避難所情報が登録されていません。\n指定外避難区域として登録してください。"
        }
        //検索結果0の場合避難所指定させる
        self.sisetuName.text = "ok"
        self.adName.text = tmpText
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //SyncEngine.shared.u

    }
    

}


extension hinanSiteiController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを隠す
        textField.resignFirstResponder()
        return true
    }
    
    // クリアボタンが押された時の処理
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // テキストフィールドがフォーカスされた時の処理
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // テキストフィールドでの編集が終わろうとするときの処理
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

