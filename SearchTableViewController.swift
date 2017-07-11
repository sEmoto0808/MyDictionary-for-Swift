//
//  SearchTableViewController.swift
//  new
//
//  Created by 江本匠 on 2017/07/12.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

class SearchTableViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var tableSearchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    //データ
    let dataList = ["月刊コロコロコミック（小学館）",
                    "コロコロイチバン！（小学館）",
                    "最強ジャンプ（集英社）",
                    "Vジャンプ（集英社）",
                    "週刊少年サンデー（小学館）",
                    "週刊少年マガジン（講談社）",
                    "週刊少年ジャンプ（集英社）",
                    "週刊少年チャンピオン（秋田書店）",
                    "月刊少年マガジン（講談社）",
                    "月刊少年チャンピオン（秋田書店）",
                    "月刊少年ガンガン（スクウェア）",
                    "月刊少年エース（KADOKAWA）",
                    "月刊少年シリウス（講談社）",
                    "週刊ヤングジャンプ（集英社）",
                    "ビッグコミックスピリッツ（小学館）",
                    "週刊ヤングマガジン（講談社）"]
    var searchResult:Array<String>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableSearchBar.delegate = self
        tableView.dataSource = self

        self.searchResult = dataList
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //キーボードを閉じる。
        tableSearchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //検索結果配列を空にする。
        searchResult?.removeAll()
        
        if(tableSearchBar.text == "") {
            //検索文字列が空の場合はすべてを表示する。
            searchResult = dataList
        } else {
            //検索文字列を含むデータを検索結果配列に追加する。
            for data in dataList {
                if data.lowercased().contains(tableSearchBar.text!) {
                    searchResult?.append(data)
                }
            }
        }
        
        //テーブルを再読み込みする。
        tableView.reloadData()
    }

}

extension SearchTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        //セルを取得する。
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for:indexPath as IndexPath) as UITableViewCell
        
        cell.textLabel?.text = searchResult?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return searchResult!.count
    }
}
