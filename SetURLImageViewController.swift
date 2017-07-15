//
//  SetURLImageViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/15.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class SetURLImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var secondView: UIView!
    
    let url = "http://eficientlife.com/wp-content/uploads/2016/04/coffee.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setImage(url: url, imageView: imageView)
        
        // タップジェスチャーをimageViewに追加する
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(_:))))

    }

    // タップイベントを検知した時の処理
    func imageViewTapped(_ sender: UITapGestureRecognizer) {
        
        let vc = ReceiveValueViewController.create()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension SetURLImageViewController {
    
    func setImage(url: String, imageView: UIImageView) {
        
        let url = NSURL(string: url)
        let imageData = try? Data(contentsOf: url! as URL)
        let image = UIImage(data:imageData!)
        imageView.image = image
        
    }

}
