//
//  infoCell2.swift
//  disaster_ios
//
//  Created by WKC on 2017/01/22.
//  Copyright © 2017年 WKC. All rights reserved.
//


import Foundation
import UIKit

class infoCell2:UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var textViewLabel: UITextView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
    }
    
    func setCell(_ infoSet:InfoClass){
        self.textViewLabel.isUserInteractionEnabled = true
        nameLabel.text = infoSet.name
        textViewLabel.text = infoSet.text
        dateLabel.text = infoSet.date
    }
    
    
}
