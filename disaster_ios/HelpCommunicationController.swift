//
//  helpCommunication.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import UIKit

class HelpCommunicationController: UIViewController {
    
    var infoList:[Int:InfoClass] = [:]
    var infoTableView: UITableView!
    
    var header:UIView!
    var iconView:UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   /* func setTableView(){
        infoTableView = UITableView(frame:CGRect(x:0,y:100,width:self.view.frame.size.height,height:self.view.frame.size.height-150))
        infoTableView.delegate = self
        infoTableView.dataSource = self
        let nib = UINib(nibName: "infoCell2", bundle: nil)
        self.infoTableView.register(nib, forCellReuseIdentifier: "infoCell2")
        
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
        }*/

    
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
        return infoList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return infoTableView.frame.size.height/5;//self.view.frame.size.height/6;
    }
    
    /*
     Cellに値を設定する
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell2", for: indexPath) as! infoCell2
        // Cellに値を設定する.
        print("せる登録でき得る")
        cell.setCell(infoList[indexPath.row]!)
        
        return cell
    }

}
