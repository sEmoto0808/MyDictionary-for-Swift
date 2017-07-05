//
//  TableView.swift
//  Practice_TableView
//
//  Created by 江本匠 on 2017/04/04.
//  Copyright © 2017年 XXXXXXXX. All rights reserved.
//
import Foundation
import UIKit

class TableView: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var vegetables:Array<String>?
    
    override init() {
        vegetables = ["Pumpkin", "Cabbage", "Potato", "Ginger", "Onion", "Carrot", "Garlic"]
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (vegetables?.count)!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルの作成
        let cell:CustomTableCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! CustomTableCell
        
        // セルの設定
        cell.setCell(text: (vegetables?[indexPath.row])!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルがタップされた時の処理
    }

}
