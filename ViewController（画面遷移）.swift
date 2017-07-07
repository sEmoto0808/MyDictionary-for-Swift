//
//  ViewController.swift
//  ********
//
//  Created by *** on 2017/07/03.
//  Copyright © 2017年 ********.jp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let table = TableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = table
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        folderTableView.reloadData()
        
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        let storyboard: UIStoryboard = UIStoryboard(name: "***", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "---")
        let navi = UINavigationController(rootViewController: viewController)
     
        self.present(navi, animated: true, completion: nil)
     
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
