//
//  SongListAPI.swift
//  ios-iTunesSearch-practice
//
//  Created by 江本匠 on 2017/09/07.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

enum SongListStatus {
    case initialize
    case loading
    case loaded([Song])
    case offline
    case error(message: String)
}

protocol SongListLoadable: class {
    func setResult(result: SongListStatus)
}

final class SongListAPI {
    
    weak var loadable: SongListLoadable?
    
    /// iTunes検索API実行
    ///
    /// - Parameters:
    ///   - keyword: 検索keyword
    func load(keyword: String) {
        
        guard NetworkChecker.isOnline() else {
            loadable?.setResult(result: .offline)
            return
        }
        
        let params = SongListParamsBuilder.create(keyword: keyword)
        
        let router = APIRouter.musicSearch(params)
        
        APIClient.request(router: router) { [weak self] (response) in
            
            guard let `self` = self else { return }
            
            switch response {
            case .success(let result):
                if let result = Mapper<Song>().mapArray(JSONObject: result) {
                    self.loadable?.setResult(result: .loaded(result))
                }
                
            case .failure(let error):
                
                // TODO: エラー時のメッセージは仕様が確定次第修正
                self.loadable?.setResult(result: .error(message: error.localizedDescription))
            }
        }
    }
}
