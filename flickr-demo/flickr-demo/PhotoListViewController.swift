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

    // MARK: - IBOutlet
    @IBOutlet weak var photoSearchBar: UISearchBar!
    @IBOutlet weak var ListStatusTabBar: UITabBar!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    fileprivate let photosearchAPI = PhotoSearchAPI()
    fileprivate let dataSource = PhotoListProvider()
    
    // MARK: - Layout
    fileprivate let culumNum: CGFloat = 2
    fileprivate let margin: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - PhotoSearchLoadable
extension PhotoListViewController: PhotoSearchLoadable {
    
    func setResult(result: PhotoSearchStatus) {
        
        SVProgressHUD.dismiss()
        
        switch result {
        case .loaded(let response):
            print("\(response)")
            //photoCollectionView.reloadData()
            //let url = PhotoURLBuilder.create(photo: response.photos)
            
        case .error(message: let message):
            print("\(message)")
            
        default:
            print("falure")
        }
    }
}

// MARK: - UISearchBarDelegate
extension PhotoListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = photoSearchBar.text else {
            return
        }
        SVProgressHUD.show()
        photosearchAPI.loadable = self
        photosearchAPI.load(tags: searchText)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotoListViewController: UICollectionViewDelegateFlowLayout {
    
    // セルの大きさ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellSize:CGFloat = collectionView.frame.size.width/culumNum-margin
        
        return CGSize(width: cellSize, height: cellSize)
    }
}

// file provate
extension PhotoListViewController {
    
    func setup() {
        photoCollectionView.dataSource = dataSource
    }
}
