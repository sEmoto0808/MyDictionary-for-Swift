//
//  CustomTableCell.swift
//  Practice_TableView
//
//  Created by 江本匠 on 2017/04/04.
//  Copyright © 2017年 XXXXXXXX. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell (text:String) {
        
        self.textLabel?.text = text
        
    }

}
