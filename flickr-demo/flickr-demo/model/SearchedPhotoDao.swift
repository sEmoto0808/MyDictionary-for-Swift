//
//  PhotoDao.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/12.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import RealmSwift

final class SearchedPhotoDao {
    
    static let dao = RealmDaoBase<SearchedPhoto>()
    
    /*
     * 写真のURLを追加する
     * - Parameters:
     *    - message: メッセージ
     */
    static func add(url: String) {
        
        let object = SearchedPhoto()
        object.photoID = dao.newId()!
        object.photoURL = url
        
        dao.add(data: object)
    }
    
    /*
     * お気に入りで検索する
     * - Returns:
     *    - お気に入り写真一覧
     */
    static func findByFavorited() -> [SearchedPhoto] {
        
        // favorite = 0: not favorite
        // favorite = 1: favorite
        let condition = "favorite = %d"
        
        return dao.findAll()
            .filter(condition, 1)
            .map { SearchedPhoto(value: $0) }
    }
    
    /*
     * お気に入りに設定する
     * - Parameters:
     *    - id: お気に入りに設定する写真のID
     */
    static func updateFavoriteStatusByKey(id: Int) -> Bool {
        
        guard let object = dao.findByKey(key: id) else {
            return false
        }
        object.favorite = 1
        // favorite = 0: not favorite
        // favorite = 1: favorite
        let result: Bool = dao.update(data: object)
        
        return result
    }
    
    /*
     * 写真一覧を取得する
     * - Returns:
     *    - 写真一覧
     */
    static func findAll() -> [SearchedPhoto] {
        return dao.findAll().map { SearchedPhoto(value: $0) }
    }
    
    /*
     * 写真をすべて削除する
     */
    static func deleteAll() {
        dao.deleteAll()
    }
}
