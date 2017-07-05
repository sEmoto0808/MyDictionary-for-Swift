//
//  ViewController.swift
//  Practice_TableView
//
//  Created by 江本匠 on 2017/04/04.
//  Copyright © 2017年 XXXXXXXX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let table = TableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = table
        tableView.dataSource = table
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

