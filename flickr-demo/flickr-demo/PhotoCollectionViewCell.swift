//
//  PhotoCollectionViewCell.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/12.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.size.width = (superview?.size.width)! / 2
    }
    
    // セルを再利用する時にnilにする
    override func prepareForReuse() {
        
        photoImageView.image = nil
    }
    
    // 写真をセルにセットする
    func setImageFromURL(urlString: String) {
        
        guard let url = URL(string: urlString) else {
            return
        }

        photoImageView.kf.setImage(with: url)
    }
    
}
