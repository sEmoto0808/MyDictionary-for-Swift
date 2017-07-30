//
//  UserMessageDao.swift
//  new
//
//  Created by 江本匠 on 2017/07/29.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import RealmSwift

final class UserMessageDao {
    
    static let dao = RealmDaoBase<UserMessage>()
    
    /*
     * メッセージを追加する
     * - Parameters:
     *    - message: メッセージ
     *    - updated: 登録日時
     */
    static func add(message: String, updated: Date? = nil) {
        
        let object = UserMessage()
        object.messageID = dao.newId()!
        object.message = message
        // 三項演算子
        // updatedがnilだったらDate().now(), nilじゃなければupdatedを代入
        object.updated = updated == nil ? Date().now() : updated!
        dao.add(data: object)
    }
    
    /*
     * 登録日で検索する
     * - Parameter:
     *    - postDate: 登録日
     * - Returns:
     *    - メッセージ一覧
     */
    static func findBy(postDate: String) -> [UserMessage] {
        
        let dateFormat = "yyyy-MM-dd HH:mm:ss"
        let condition = "updated >= %@ AND updated <= %@"
        
        let fromDate = "\(postDate) 00:00:00".toDateStyleMedium(dateFormat: dateFormat)
        let toDate = "\(postDate) 23:59:59".toDateStyleMedium(dateFormat: dateFormat)
        
        return dao.findAll()
            .filter(condition, fromDate, toDate)
            .map { UserMessage(value: $0) }
    }
    
    /*
     * 登録日で集計する
     * - Returns:
     *    - メッセージ一覧
     */
    static func groupByPostDate() -> [String] {
        
        let messages = UserMessageDao.dao.findAll()
        var results = [String]()
        
        for message in messages {
            
            guard let postDate = message.updated
                .description.components(separatedBy: " ").first else {
                    continue
            }
            
            if (results.filter { $0 == postDate }.count > 0) {
                // resultsにすでにpostDateと同じ文字列が含まれていた場合は
                // resultsへのpostDate追加処理
                // results.append(postDate)
                // をスキップする．
                continue
            }
            results.append(postDate)
        }
        return results
    }
    
    /*
     * メッセージ一覧を取得する（降順）
     * - Returns:
     *    - メッセージ一覧
     */
    static func findAll() -> [UserMessage] {
        return dao.findAll()
            .sorted(byKeyPath: "updated", ascending: true)
            .map { UserMessage(value: $0) }
    }
    
    /*
     * メッセージをすべて削除する
     */
    static func deleteAll() {
        dao.deleteAll()
    }
}
