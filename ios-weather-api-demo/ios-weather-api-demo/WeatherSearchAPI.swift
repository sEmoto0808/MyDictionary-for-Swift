//
//  WeatherSearchAPI.swift
//  ios-weather-api-demo
//
//  Created by 江本匠 on 2017/08/15.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

/// クーポン情報一覧取得APIステータス
enum WeatherSearchStatus {
    case loading
    case loaded([WeatherSearchResponse])
    case offline
    case timeout
    case error(message: String)
}

/// クーポン情報一覧取得API結果を通知するプロトコル
protocol WeatherSearchLoadable: class {
    func setResult(result: WeatherSearchStatus)
}

/// クーポン情報一覧取得API実行クラス
final class WeatherSearchAPI: NSObject {
    
    weak var loadable: WeatherSearchLoadable?
    
    /// クーポン情報一覧取得API実行
    ///
    /// - Parameters:
    ///   - passportName: クーポン名
    func load(cityID: String) {
        
        guard NetworkChecker.isOnline() else {
            loadable?.setResult(result: .offline)
            return
        }
        
        let parameters = WeatherSearchParamsBuilder.create(cityID: cityID)
        let router = APIRouter.weatherSearch(params: parameters)
        
        APIClient().request(router: router) { [weak self] (response) in
            
            switch response {
            case .success(let result):
                if let result = Mapper<WeatherSearchResponse>().mapArray(JSONObject: result) {
                    self?.loadable?.setResult(result: .loaded(result))
                } else {
                    // TODO: エラー時のメッセージは仕様が確定次第修正
                    // responsがnilの場合もエラー
                    self?.loadable?.setResult(result: .error(message: ""))
                }
                
            case .failure(let error):
                
                if error._code == NSURLErrorTimedOut {
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
