//
//  PhotoListViewController.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/12.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController {

    @IBOutlet weak var photoSearchBar: UISearchBar!
    @IBOutlet weak var ListStatusTabBar: UITabBar!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
