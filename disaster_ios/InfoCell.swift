//
//  InfoCell.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/21.
//  Copyright © 2017年 WKC. All rights reserved.
//

import Foundation
import UIKit

class infoCell:UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var textViewLabel: UITextView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    func setCell(_ infoSet:UserInfo){
        nameLabel.text = infoSet.name
        textViewLabel.text = infoSet.text
        dateLabel.text = "2017年x月x日"
    }

    
}
