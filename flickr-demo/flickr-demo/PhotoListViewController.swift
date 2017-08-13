//
//  PhotoListViewController.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/12.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import STV_Extensions
import SVProgressHUD

class PhotoListViewController: UIViewController {

    @IBOutlet weak var photoSearchBar: UISearchBar!
    @IBOutlet weak var ListStatusTabBar: UITabBar!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    fileprivate let dataSource = PhotoListProvider()
    fileprivate let culumNum: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - PhotoSearchLoadable
extension PhotoListViewController: PhotoSearchLoadable {
    
    func setStatus(status: PhotoListStatus) {
        
        SVProgressHUD.dismiss()
        
        switch status {
        case .normal(let result):
            
            print("\(result)")
            //photoCollectionView.reloadData()
            
        default:
            
            print("falure")
        }
    }
}

// MARK: - UISearchBarDelegate
extension PhotoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoListViewController: UICollectionViewDelegateFlowLayout {
    
    // セルの大きさ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize:CGFloat = collectionView.frame.size.width/culumNum-2
        
        return CGSize(width: cellSize, height: cellSize)
    }
}

// file provate
extension PhotoListViewController {
    
    func setup() {
        photoCollectionView.dataSource = dataSource
    }
}
