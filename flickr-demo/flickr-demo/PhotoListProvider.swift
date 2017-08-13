//
//  PhotoListProvider.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/12.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import STV_Extensions

class PhotoListProvider: NSObject {
    
    var photoItems = [String]()
    

}

// MARK: - UICollectionViewDataSource
extension PhotoListProvider: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return photoItems.count
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.className,for: indexPath) as! PhotoCollectionViewCell
        
        let url = "https://www.apple.com/ac/structured-data/images/open_graph_logo.png?201707121536"
        
        cell.setImageFromURL(urlString: url)
        
        return cell
    }
}
