//
//  MultiImageTableViewCell.swift
//  new
//
//  Created by 江本匠 on 2017/07/16.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class MultiImageTableViewCell: UITableViewCell {

    @IBOutlet weak var passportImageView: UIImageView!
    @IBOutlet weak var passportStatusImageView: UIImageView!
    @IBOutlet weak var limitDateLabel: UILabel!
    @IBOutlet weak var useCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*
     // 強制アンラップを用いない方法
     func setImage(urlString: String, imageView: UIImageView) {
     
     guard let url = URL(string: urlString) else { return }
     imageView.kf.setImage(with: url)  <-- ライブラリKingfisherを使う
     }
     */
    
    // userMessageLabel.textAlignment = NSTextAlignment.center
    
    func setPassportImage(url: String) {
        
        let url = NSURL(string: url)
        let imageData = try? Data(contentsOf: url! as URL)
        let image = UIImage(data:imageData!)
        passportImageView.image = image
        
    }
    
    func setStatusImage(url: String) {
        
        let url = NSURL(string: url)
        let imageData = try? Data(contentsOf: url! as URL)
        let image = UIImage(data:imageData!)
        passportStatusImageView.image = image
        
    }
    
    func setUseCountLabel(useCount: String) {
        
        useCountLabel.text = "今月の利用回数：\(useCount)回"
        
    }
    
    func setLimitDateLabel(limitDate: String) {
        
        limitDateLabel.text = "利用期限：\(limitDate)"
        
    }


}
