//
//  myInfo.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import UIKit


class MyInfoViewController: UIViewController {

    var tyusyaku:UIView!
    
    var myIcon:UIImageView!
    var myImage:UIImage!
    
    var myName:UILabel!
    var hinanjyo:UILabel!
    
    var jibyo:UILabel!
    var skill:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setView()
        setInfo()
    }
    
    func setInfo(){
        //dbから引っ張る
        myIcon.image = UIImage(named:"cominity__user.png")
        myName.text = "和田  kc"
        hinanjyo.text = "東京ガーデンテラス紀尾井町"
        jibyo.text = "特になし"
        skill.text = "医療関係の知識あり"
    }
    
    func setView(){
        let slabel = UILabel(frame:CGRect(x:self.view.frame.size.width/3,y:15,width:self.view.frame.size.width/3,height:30))
        slabel.text = "自分の情報"
        slabel.textAlignment = .center
        slabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        slabel.textColor = UIColorFromRGB(0x2E343B)
        self.view.addSubview(slabel)
        //注釈
        tyusyaku = UIView(frame:CGRect(x:0,y:50,width:self.view.frame.size.width,height:100))
        tyusyaku.backgroundColor = UIColorFromRGB(0xE6EAED)
        let tyusyakuLabel = UILabel(frame:CGRect(x:10,y:10,width:self.view.frame.size.width,height:20))
        tyusyakuLabel.text = "自身の安否情報を登録しましょう"
        //tyusyakuLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(18))
        tyusyakuLabel.font = UIFont(name: "HiraginoSans-W6", size: 18)
        tyusyakuLabel.backgroundColor = UIColorFromRGB(0xE6EAED)
        tyusyakuLabel.textColor = UIColorFromRGB(0x93979C)
        tyusyaku.addSubview(tyusyakuLabel)
        let tyusyakuText = UITextView(frame:CGRect(x:6,y:30,width:self.view.frame.size.width-10,height:70))
        tyusyakuText.text = "登録を行えば避難所ごとにオフラインでも使用できるチャットが使えるようになります。登録された情報は市町村などで被災地支援のために活用されます。"
        tyusyakuText.isUserInteractionEnabled = false
        tyusyakuText.backgroundColor = UIColorFromRGB(0xE6EAED)
        tyusyakuText.textColor = UIColorFromRGB(0x93979C)
        tyusyakuText.font = UIFont(name: "HiraginoSans-W3", size: 14)
        self.tyusyaku.addSubview(tyusyakuText)
        self.view.addSubview(tyusyaku)
        
        
        myIcon = UIImageView(frame:CGRect(x:self.view.frame.size.width/2-40,y:170,width:80,height:80))
        myIcon.layer.cornerRadius = 40.0
        myIcon.layer.masksToBounds = true
        self.view.addSubview(myIcon)
        
        //名前欄
        let nameView = UIView(frame:CGRect(x:00,y:280,width:self.view.frame.size.width,height:50))
        nameView.layer.borderWidth = 0.5
        nameView.layer.borderColor = UIColorFromRGB(0xe3e3e3).cgColor
        let nameLabel = UILabel(frame:CGRect(x:20,y:280,width:self.view.frame.size.width,height:50))
        nameLabel.text = "名前"
        nameLabel.font = UIFont(name: "HiraginoSans-W6", size: 16)
        nameLabel.textColor = UIColorFromRGB(0xAAAAAA)
        myName = UILabel(frame:CGRect(x:80,y:280,width:self.view.frame.size.width,height:50))
        myName.textColor = UIColorFromRGB(0x15AFEF)
        self.view.addSubview(nameView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(myName)
        
        //避難じょ
        let hinanView = UIView(frame:CGRect(x:0,y:330,width:self.view.frame.size.width,height:100))
        hinanView.layer.borderWidth = 0.5
        hinanView.layer.borderColor = UIColorFromRGB(0xe3e3e3).cgColor
        let hinanLabel = UILabel(frame:CGRect(x:20,y:330,width:100,height:50))
        hinanLabel.text = "避難所"
        hinanLabel.textColor = UIColorFromRGB(0xAAAAAA)
        hinanLabel.font = UIFont(name: "HiraginoSans-W6", size: 14)

        
        hinanjyo = UILabel(frame:CGRect(x:80,y:330,width:self.view.frame.size.width,height:50))
        hinanjyo.font =  UIFont.systemFont(ofSize: CGFloat(12))
        hinanjyo.textColor = UIColorFromRGB(0x2E343B)

        let hinanChangeView = UIButton(frame:CGRect(x:80,y:380,width:203.5,height:35))
        hinanChangeView.setImage(UIImage(named:"gazo.png"), for: .normal)
        hinanChangeView.addTarget(self, action: "changeView", for: .touchUpInside)
        
        //hinanLabel.textColor = //UIColorFromRGB(0x14F3FF)
        self.view.addSubview(hinanView)
        self.view.addSubview(hinanLabel)
        self.view.addSubview(hinanjyo)
        self.view.addSubview(hinanChangeView)
        
        
        
        //持病
        let byoukiView = UIView(frame:CGRect(x:00,y:430,width:self.view.frame.size.width,height:50))
        byoukiView.layer.borderWidth = 0.5
        byoukiView.layer.borderColor = UIColorFromRGB(0xe3e3e3).cgColor
        let byoukiLabel = UILabel(frame:CGRect(x:20,y:430,width:self.view.frame.size.width,height:50))
        byoukiLabel.text = "特になし"
        byoukiLabel.textColor = UIColorFromRGB(0xAAAAAA)
        byoukiLabel.font = UIFont(name: "HiraginoSans-W6", size: 14)
        jibyo = UILabel(frame:CGRect(x:80,y:430,width:self.view.frame.size.width,height:50))
        jibyo.textColor = UIColorFromRGB(0x15AFEF)
        jibyo.font = UIFont(name: "HiraginoSans-W3", size: 13)
        self.view.addSubview(byoukiView)
        self.view.addSubview(byoukiLabel)
        self.view.addSubview(jibyo)
        
        //スキル
        let skillView = UIView(frame:CGRect(x:00,y:480,width:self.view.frame.size.width,height:50))
        skillView.layer.borderWidth = 0.5
        skillView.layer.borderColor = UIColorFromRGB(0xe3e3e3).cgColor
        let skillLabel = UILabel(frame:CGRect(x:20,y:480,width:self.view.frame.size.width,height:50))
        skillLabel.text = "スキル"
        skillLabel.textColor = UIColorFromRGB(0xAAAAAA)
        skillLabel.font = UIFont(name: "HiraginoSans-W6", size: 14)
        skill = UILabel(frame:CGRect(x:80,y:480,width:self.view.frame.size.width,height:50))
        skill.textColor = UIColorFromRGB(0x15AFEF)
        skill.font = UIFont(name: "HiraginoSans-W3", size: 13)
        self.view.addSubview(skillView)
        self.view.addSubview(skillLabel)
        self.view.addSubview(skill)

        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(SyncEngine.shared.userAll())

    }


    func changeView(){
        var hinan = hinanSiteiController()
        self.present(hinan, animated: true, completion: nil)
        
    }
    
    
    
}
