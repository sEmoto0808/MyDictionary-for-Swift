//
//  AccordViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/10.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class AccordViewController: UIViewController {

    @IBOutlet weak var accordTableView: UITableView!
    
    var items = [
        ["A", "1"],
        ["B", "2"],
        ["C", "3"],
        ["D", "4"],
        ]
    var openedSections = Set<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accordTableView.delegate = self
        accordTableView.dataSource = self
        
        
    }
    
    func tapSectionHeader(sender: UIGestureRecognizer) {
        if let section = sender.view?.tag {
            if self.openedSections.contains(section) {
                self.openedSections.remove(section)
            } else {
                self.openedSections.insert(section)
            }
            
            self.accordTableView.reloadSections(IndexSet(integer: section), with: .fade)
        }
    }

}

// MARK: UITableViewDataSource
extension AccordViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.openedSections.contains(section) {
            return self.items[section].count-1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccordCell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.section][1]
        
        return cell
    }
}


extension AccordViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.items[section][0]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UITableViewHeaderFooterView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapSectionHeader(sender:)))
        view.addGestureRecognizer(gesture)
        view.tag = section
        
        return view
    }
}
