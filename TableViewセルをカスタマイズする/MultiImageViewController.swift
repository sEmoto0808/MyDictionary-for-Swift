//
//  MultiImageViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/16.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class MultiImageViewController: UIViewController {
    
    @IBOutlet weak var passportListTableView: UITableView!
    
    let url = "https://store.storeimages.cdn-apple.com/4974/as-images.apple.com/is/image/AppleInc/aos/published/images/c/at/cat/header/cat-header-leather?wid=2880&hei=640&fmt=jpeg&qlt=80&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=1495216260270"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        passportListTableView.dataSource = self
        passportListTableView.delegate = self

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPathForSelectedRow = passportListTableView.indexPathForSelectedRow {
            passportListTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }
    
}

// MARK: UITableViewDataSource
extension MultiImageViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MultiImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MultiImageCell", for: indexPath as IndexPath) as! MultiImageTableViewCell
        
        cell.setPassportImage(url: url)
        cell.setStatusImage(url: url)
        cell.setUseCountLabel(useCount: "1")
        cell.setLimitDateLabel(limitDate: "7/31")
        
        
        return cell
    }
}

extension MultiImageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "クーポン名"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = ViewController.create()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
