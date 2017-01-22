//
//  helpCommunication.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import UIKit
import APIKit

class HelpCommunicationController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var infoList:[Int:InfoClass] = [:]
    var infoTableView: UITableView!
    
    
    var infoset:[Int:UserInfo] = [:]
    var header:UIView!
    var iconView:UIImageView!
    
    var imageView:UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setHeader()
        setTableView()

    }
    
    func setHeader(){
        self.imageView = UIImageView(frame:self.view.bounds)
        imageView.image = UIImage(named:"top.png")
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(imageView)
        
        var titleLabel = UILabel(frame:CGRect(x:self.view.frame.size.width/6,y:10,width:self.view.frame.size.width*2/3,height:40))
        titleLabel.text = "紀尾井町ガーデンテラス　緊急避難所"
        titleLabel.textColor = UIColor.white
        var toukou = UIButton(frame:CGRect(x:self.view.frame.size.width-50,y:10,width:40,height:50))
        toukou.setImage(UIImage(named:"community_pen.png"), for:.normal)
        toukou.addTarget(self, action: "toukouView", for: .touchUpInside)
        self.view.addSubview(toukou)

    }
    
    func toukouView(){
        self.present(toukouController(), animated: true, completion: nil)
    }
    
    func setTableView(){
        infoTableView = UITableView(frame:CGRect(x:0,y:100,width:self.view.frame.size.width,height:self.view.frame.size.height-150))
        infoTableView.delegate = self
        infoTableView.dataSource = self
        let nib = UINib(nibName: "infoCell", bundle: nil)
        self.infoTableView.register(nib, forCellReuseIdentifier: "infoCell")
        self.view.addSubview(infoTableView)
        
        infoset = [0:UserInfo(id: "1",name: "山本 幸治",text: "家族３人で避難しています。乳児がいますがミルクがないので至急ミルクが必要です。自宅も倒壊してしまったので哺乳瓶も手元にありません。"),1:UserInfo(id:"2",name:"武田 佳子",text:"インシュリンが必要なので、届けて欲しいです。同じ避難所か周囲の避難所の方にもお願いしたいです。"),2:UserInfo(id:"3",name:"鈴木 太郎",text:"米・小麦粉アレルギーなのでこの避難所にある備蓄食料で食べられません。アレルギー対応食をお願いします。"),3:UserInfo(id:"4",name:"岡本次郎",text:"ok")]
        self.infoTableView.reloadData()
        /*let request = TwitterAPI.TwitterEnum.all()
        Session.send(request) { result in
            switch result {
            case .success(let info):
                var ind = 0
                for i in info.list{
                    self.infoList[ind] = InfoClass(name:info.name,text:i)
                    ind = ind + 1
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.infoTableView.reloadData()
                }
                
            case .failure(let error): print(error)
            }
        }*/
        
    }
}


extension HelpCommunicationController{
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1;
    }
    /*
     Cellが選択された際に呼び出される
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    /*
     Cellの総数を返す.
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        return infoset.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return infoTableView.frame.size.height/5;//self.view.frame.size.height/6;
    }
    
    /*
     Cellに値を設定する
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        print("aaaaaa")
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! infoCell
        // Cellに値を設定する.
        cell.setCell(infoset[indexPath.row]!)
        return cell
    }

}
