//
//  toukouController.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import UIKit

class toukouController: UIViewController {
    
    
    var tyusyaku:UIView!
    
    var touko : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setTop()
        setMidasi()
        setText()
    }
    
    func setTop(){
        var cancelButton = UIButton(frame:CGRect(x:20,y:10,width:100,height:30))
        cancelButton.setTitle("キャンセル", for: .normal)
        cancelButton.addTarget(self, action: "close", for: .touchUpInside)
        self.view.addSubview(cancelButton)
        
        var toukouButton = UIButton(frame:CGRect(x:self.view.frame.size.width-100,y:10,width:100,height:30))
        toukouButton.setTitle("投稿", for: .normal)
        toukouButton.addTarget(self, action: "post", for: .touchUpInside)
        self.view.addSubview(toukouButton)
    }
    
    func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func post(){
        
    }
    
    func setText(){
        
        var topLabel = UILabel(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:50))
        topLabel.text = "ここに入力してください"
        topLabel.font = UIFont.systemFont(ofSize: 17.0)

        
        touko = UITextField(frame:CGRect(x:80,y:150,width:self.view.frame.size.width,height:50))
        touko.textColor = UIColorFromRGB(0x14F3FF)

        self.view.addSubview(touko)
        

        
    }
    
    
    func setMidasi(){
        //注釈
         tyusyaku = UIView(frame:CGRect(x:0,y:50,width:self.view.frame.size.width,height:90))
        tyusyaku.backgroundColor = UIColorFromRGB(0xE6EAED)
        var tyusyakuLabel = UILabel(frame:CGRect(x:10,y:5,width:self.view.frame.size.width,height:10))
        tyusyakuLabel.text = "自身の安否情報を登録しましょう"
        tyusyakuLabel.font = UIFont.systemFont(ofSize: CGFloat(15))
        tyusyakuLabel.backgroundColor = UIColorFromRGB(0xE6EAED)
        tyusyakuLabel.textColor = UIColorFromRGB(0x2E343B)
        tyusyaku.addSubview(tyusyakuLabel)
        var tyusyakuText = UITextView(frame:CGRect(x:10,y:20,width:self.view.frame.size.width-10,height:60))
        tyusyakuText.text = "避難所コミュニティに書き込むと同じ避難所のユーザーが投稿を見ることができます。また、避難所の誰かがオンラインになった時に行政に投稿が表示されます。"
        tyusyakuText.isUserInteractionEnabled = false
        tyusyakuText.backgroundColor = UIColorFromRGB(0xE6EAED)
        self.tyusyaku.addSubview(tyusyakuText)
        self.view.addSubview(tyusyaku)

    }
    
}
