//
//  PhotoCollectionViewCell.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/12.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    // セルを再利用する時にnilにする
    override func prepareForReuse() {
        
        photoImageView.image = nil
    }
    
    // 写真をセルにセットする
    func setImageFromURL(url: String) {
        
        guard let url = URL(string: url) else {
            return
        }
        guard let imageData = try? Data(contentsOf: url) else {
            return
        }
        
        let image = UIImage(data: imageData)
        self.photoImageView.image = image
    }
    
}
