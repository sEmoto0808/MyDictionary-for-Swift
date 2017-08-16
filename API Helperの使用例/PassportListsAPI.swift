//
//  PassportListsAPI.swift
//  FirstPassport
//
//  Created by 江本匠 on 2017/07/16.
//  Copyright © 2017年 Smart Tech Ventures. All rights reserved.
//

import ObjectMapper

/// クーポン情報一覧取得APIステータス
enum PassportListsStatus {
    case loading
    case loaded([PassportListsResponse])
    case offline
    case timeout
    case error(message: String)
}

/// クーポン情報一覧取得API結果を通知するプロトコル
protocol PassportListsLoadable: class {
    func setResult(result: PassportListsStatus)
}

/// クーポン情報一覧取得API実行クラス
final class PassportListsAPI: NSObject {
    
    weak var loadable: PassportListsLoadable?
    
    /// クーポン情報一覧取得API実行
    ///
    /// - Parameters:
    ///   - passportName: クーポン名
    func load(passportName: String) {
        
        guard APIClient.isOnline() else {
            loadable?.setResult(result: .offline)
            return
        }
        
        let parameters = PassportListsParamsBuilder.create(passportName: passportName)
        let router = Router.passportLists(parameters: parameters, needsSessionToken: true)
        
        APIClient().request(router: router) { [weak self] (response) in
            
            switch response {
            case .success(let result):
                if let result = Mapper<PassportListsResponse>().mapArray(JSONObject: result) {
                    self?.loadable?.setResult(result: .loaded(result))
                } else {
                    // TODO: エラー時のメッセージは仕様が確定次第修正
                    // responsがnilの場合もエラー
                    self?.loadable?.setResult(result: .error(message: ""))
                }
                
            case .failure(let error):
                
                if error.code == NSURLErrorTimedOut {
                    // タイムアウト
                    self?.loadable?.setResult(result: .timeout)
                } else {
                    // TODO: エラー時のメッセージは仕様が確定次第修正
                    self?.loadable?.setResult(result: .error(message: error.localizedDescription))
                }
            }
        }
    }
}
