//
//  toukouController.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import UIKit

class toukouController: UIViewController,UITextFieldDelegate {
    
    
    var tyusyaku:UIView!
    
    var touko : UITextField!
    var tmpText:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setTop()
        setMidasi()
        setText()
    }
    
    func setTop(){
        let cancelButton = UIButton(frame:CGRect(x:20,y:30,width:100,height:40))
        cancelButton.setTitle("キャンセル", for: .normal)
        cancelButton.setTitleColor(UIColorFromRGB(0x15AFEF), for:.normal)
        cancelButton.addTarget(self, action: "close", for: .touchUpInside)
        self.view.addSubview(cancelButton)
        
        let toukouButton = UIButton(frame:CGRect(x:self.view.frame.size.width-100,y:30,width:100,height:40))
        //toukouButton.
        //toukouButton.backgroundColor = UIColor.blue
        toukouButton.setTitle("投稿", for: .normal)
        toukouButton.setTitleColor(UIColorFromRGB(0x15AFEF), for: .normal)
        //toukouButton.titleLabel?.textColor  = UIColorFromRGB(0x15AFEF)
        toukouButton.addTarget(self, action: "post", for: .touchUpInside)
        self.view.addSubview(toukouButton)
    }
    
    func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func post(){
        print("fieled=>\(touko.text)")
    }
    
    func setText(){
        
        /*var topLabel = UILabel(frame:CGRect(x:0,y:80,width:self.view.frame.size.width,height:50))
        topLabel.text = "ここに入力してください"
        topLabel.font = UIFont.systemFont(ofSize: 17.0)*/

        
        touko = UITextField(frame:CGRect(x:10,y:200,width:self.view.frame.size.width - 20,height:100))
        touko.textColor = UIColorFromRGB(0x14F3FF)
        touko.placeholder = "ここに入力してください"
        touko.delegate = self
        self.view.addSubview(touko)
        

        
    }
    
    
    func setMidasi(){
        //注釈
         tyusyaku = UIView(frame:CGRect(x:0,y:90,width:self.view.frame.size.width,height:100))
        tyusyaku.backgroundColor = UIColorFromRGB(0xE6EAED)
        let tyusyakuLabel = UILabel(frame:CGRect(x:10,y:10,width:self.view.frame.size.width,height:20))
        tyusyakuLabel.text = "自身の安否情報を登録しましょう"
        tyusyakuLabel.font = UIFont(name: "HiraginoSans-W6", size: 17)
        tyusyakuLabel.backgroundColor = UIColorFromRGB(0xE6EAED)
        tyusyakuLabel.textColor = UIColorFromRGB(0xAAAAAA)
        //tyusyakuLabel.textColor = UIColorFromRGB(0x2E343B)
        tyusyaku.addSubview(tyusyakuLabel)
        let tyusyakuText = UITextView(frame:CGRect(x:10,y:30,width:self.view.frame.size.width-10,height:60))
        tyusyakuText.text = "避難所コミュニティに書き込むと同じ避難所のユーザーが投稿を見ることができます。また、避難所の誰かがオンラインになった時に行政に投稿が表示されます。"
        tyusyakuText.font = UIFont(name: "HiraginoSans-W3", size: 12)
        tyusyakuText.textColor = UIColorFromRGB(0xAAAAAA)
        tyusyakuText.isUserInteractionEnabled = false
        tyusyakuText.backgroundColor = UIColorFromRGB(0xE6EAED)
        self.tyusyaku.addSubview(tyusyakuText)
        self.view.addSubview(tyusyaku)

    }
    
}

extension toukouController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを隠す
        tmpText = textField.text!
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


