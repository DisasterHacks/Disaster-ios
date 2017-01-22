//
//  HinanjyoController.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import UIKit
import APIKit
import Himotoki

class PublicInfoController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Tableで使用する配列を設定する
     var infoList:[Int:InfoClass] = [:]
     var infoTableView: UITableView!
    
    var header:UIView!
    var iconView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColorFromRGB(0xE6EAED)
        
        setTableView()
        setHeader()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func setHeader(){
        let header = UIView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:100))
        header.backgroundColor = UIColor.blue
        
        let headerTitle = UILabel(frame:CGRect(x:90,y:50,width:120,height:20))
        headerTitle.text = "東京都防災"
        headerTitle.font = UIFont.systemFont(ofSize: CGFloat(17))
        headerTitle.textColor = UIColor.white
        let account = UILabel(frame:CGRect(x:220,y:50,width:100,height:20))
        account.textColor = UIColor.white
        account.text = "@tokyo_bousai"
        account.font = UIFont.systemFont(ofSize: CGFloat(14))
        let underMidasi = UILabel(frame:CGRect(x:0,y:70,width:self.view.frame.size.width,height:30))
        underMidasi.backgroundColor = UIColor.white
        underMidasi.textAlignment = .center
        underMidasi.text = "最終同期 online 17:36 offline 17:29"
        underMidasi.font = UIFont.systemFont(ofSize: CGFloat(14))
   
        
        let icon = UIImage(named:"tokyo.png")
        self.iconView = UIImageView(frame:CGRect(x:10,y:30,width:60,height:60))
        self.iconView.image = icon
        self.view.addSubview(header)
        self.view.addSubview(underMidasi)
        self.view.addSubview(headerTitle)
        self.view.addSubview(account)
        

        self.view.addSubview(iconView)
    }
    
    func setTableView(){
        infoTableView = UITableView(frame:CGRect(x:0,y:100,width:self.view.frame.size.width, height:self.view.frame.size.height-150))
        infoTableView.delegate = self
        infoTableView.dataSource = self
        let nib = UINib(nibName: "infoCell2", bundle: nil)
        self.infoTableView.register(nib, forCellReuseIdentifier: "infoCell2")
        self.infoTableView.backgroundColor = UIColor.clear
        self.infoTableView.separatorColor  = UIColor.clear
        //self.infoTableView.rowHeight       = UITableViewAutomaticDimension

        let request = TwitterAPI.TwitterEnum.all()
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
        }
        
        self.infoTableView.reloadData()
        self.view.addSubview(infoTableView)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



extension PublicInfoController{
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
        return infoList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let dummyTextView  = UITextView()
        dummyTextView.font = UIFont(name: "System", size: 14.0)
        dummyTextView.text = self.infoList[indexPath.row]?.text
        let size = dummyTextView.sizeThatFits(CGSize(width: 345, height: CGFloat.infinity))
        // return size.height
        
        return infoTableView.frame.size.height/3;//self.view.frame.size.height/6;
    }

    /*
     Cellに値を設定する
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        print(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell2", for: indexPath) as! infoCell2
        // Cellに値を設定する.
        //print("せる登録でき得る")
        cell.setCell(infoList[indexPath.row]!)
        cell.backgroundColor = UIColor.clear
        
        return cell
    }

}
