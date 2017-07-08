//
//  ViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/05.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

final class ViewController: UIViewController, UITableViewDelegate {
    
    static func create() -> ViewController {
        
        guard let vc = UIStoryboard.viewController(storyboardName: ViewController.className,
            identifier: ViewController.className) as? ViewController else {
                fatalError("unwap ViewController")
        }
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcSecond = SecondViewController.create()
        
        navigationController?.pushViewController(vcSecond, animated: true)
    }
    
    
    
    
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */

}

