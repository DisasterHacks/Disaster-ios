//
//  hinanSiteiController.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation

import UIKit


class hinanSiteiController: UIViewController, UISearchBarDelegate  {
    
    
    var tmpText:String = ""
    var mySearchBar:UISearchBar! = nil
    var explainText:UITextView!
    var sisetuName : UILabel!
    var adName:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        var topLabel = UILabel(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:50))
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
        
    func setUnderView(){
        //説明テキスト
        explainText = UITextView(frame:CGRect(x:0,y:100,width:self.view.frame.size.width,height:50))
        explainText.text = "避難所情報を入力してください。"
        self.view.addSubview(explainText)

            //s位説明
            var sisetuView = UIView(frame:CGRect(x:00,y:150,width:self.view.frame.size.width,height:50))
            sisetuView.layer.borderWidth = 0.5
            sisetuView.layer.borderColor = UIColorFromRGB(0xe3e3e3).cgColor
            var nameLabel = UILabel(frame:CGRect(x:20,y:150,width:self.view.frame.size.width,height:50))
            nameLabel.text = "施設名"
            nameLabel.textColor = UIColorFromRGB(0xAAAAAA)
            sisetuName = UILabel(frame:CGRect(x:80,y:150,width:self.view.frame.size.width,height:50))
            sisetuName.textColor = UIColorFromRGB(0x14F3FF)
            self.view.addSubview(sisetuView)
            self.view.addSubview(nameLabel)
            self.view.addSubview(sisetuName)
        
        //住所
        var adView = UIView(frame:CGRect(x:00,y:200,width:self.view.frame.size.width,height:50))
        adView.layer.borderWidth = 0.5
        adView.layer.borderColor = UIColorFromRGB(0xe3e3e3).cgColor
        var adLabel = UILabel(frame:CGRect(x:20,y:200,width:self.view.frame.size.width,height:50))
        adLabel.text = "住所"
        adLabel.textColor = UIColorFromRGB(0xAAAAAA)
        adName = UILabel(frame:CGRect(x:80,y:200,width:self.view.frame.size.width,height:50))
        adName.textColor = UIColorFromRGB(0x14F3FF)
        self.view.addSubview(adView)
        self.view.addSubview(adLabel)
        self.view.addSubview(adName)

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
        var realmFlg = false
        if(!realmFlg){
            self.explainText.text = "避難所情報が登録されていません。\n指定外避難区域として登録してください。"
        }
        //検索結果0の場合避難所指定させる
        self.sisetuName.text = "ok"
        self.adName.text = tmpText
    
    }
    

}

