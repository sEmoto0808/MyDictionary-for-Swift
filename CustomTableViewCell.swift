//
//  CustomTableViewCell.swift
//  new
//
//  Created by 江本匠 on 2017/07/13.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage (imageName: String) {
        
        let image = UIImage(named: imageName)
        self.imageView?.image = image
        
    }
    
    func setImageFromURL (url: String) {
        
        let url = NSURL(string: url)
        let imageData = try? Data(contentsOf: url! as URL)
        let image = UIImage(data:imageData!)
        self.imageView?.image = image
        
    }

}
