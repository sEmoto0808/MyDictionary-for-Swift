//
//  ImageCellViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/13.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class ImageCellViewController: UIViewController {
    
    var items = [
        ["A", "1"],
        ["B", "2"],
        ["C", "3"],
        ["C", "4"],
        ]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.sectionHeaderHeight = 30
    }
    
    func tapSectionHeader(sender: UIGestureRecognizer) {
        
        print("Tapped!")
        let vc = ViewController.create()
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

// MARK: UITableViewDataSource
extension ImageCellViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath as IndexPath) as! CustomTableViewCell
        
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        cell.setImage(imageName: "Coffee")
        
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        cell.imageView?.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        return cell
    }
}


extension ImageCellViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.items[section][0]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UITableViewHeaderFooterView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapSectionHeader(sender:)))
        
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        
        
        let image: UIImage = UIImage(named: "Coffee")!
        let width = image.size.width
        let height = image.size.height
        
        let scale = screenWidth / width
        let rect:CGRect = CGRect(x:0, y:0, width:width*scale, height:height*scale)
        
        let imageView: UIImageView = UIImageView(image: image)
        imageView.frame = rect
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        
        
        view.addGestureRecognizer(gesture)
        view.addSubview(imageView)
        
        return view
        
    }
    
}

