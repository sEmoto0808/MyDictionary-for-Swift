//
//  TableView.swift
//  *******
//
//  Created by **** on 2017/07/05.
//  Copyright © 2017年 ********.jp. All rights reserved.
//

import UIKit

class TableView: NSObject, UITableViewDataSource {
    
    override init() {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.folderTitles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルの作成
        let cell:CustomTableCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! CustomTableCell
        
        // セルの設定
        cell.setCell(text: (self.folderTitles[indexPath.row]))
        
        return cell
    }
    
}
