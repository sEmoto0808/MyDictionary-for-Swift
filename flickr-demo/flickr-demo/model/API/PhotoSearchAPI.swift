//
//  PhotoSearchAPI.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/10.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

/// FlickrAPIステータス
///
/// - initialize: 初期状態
/// - loading: 店舗情報一覧取得API実行中
/// - loaded: 成功(店舗情報の配列を返却)
/// - offline: オフライン
/// - timeout: リクエストタイムアウト
/// - error: 失敗(エラーメッセージを返却)
enum PhotoSearchStatus {
    case initialize
    case loading
    case loaded([PhotoSearchResponse])
    case offline
    case timeout
    case error(message: String)
}

/// FlickrAPI結果を通知するプロトコル
protocol PhotoSearchLoadable: class {
    func setResult(result: PhotoSearchStatus)
}

final class PhotoSearchAPI {
    
    var loadable: PhotoSearchLoadable?
//    fileprivate var isLoading = false
//    private var requestCount = 1
//    private var totalCount = 1
    
//    func waiting() -> Bool {
//        return isLoading
//    }
    
    func load(tags: String) {
        
        guard NetworkChecker.isOnline() else {
            self.loadable?.setResult(result: .offline)
            return
        }
        
        let params = PhotoSearchParamsBuilder.create(tags: tags)
        let router = APIRouter.PhotosSearch(parameters: params)
        
        APIClient().request(router:router) { [weak self] (response) in
            
            guard let `self` = self else { return }
            
            switch response {
            case .success(let result):
                if let result = Mapper<PhotoSearchResponse>().mapArray(JSONObject: result) {
                    self.loadable?.setResult(result: .loaded(result))
                }
                
            case .failure( _):
                self.loadable?.setResult(result: .error(message: "Failure"))
            }
        }
    }
    
//    private func hasPhotoList(result: PhotoSearchResponse) -> PhotoSearchStatus{
//        
//        return (result.photos.count == 0) ?
//            PhotoListStatus.noData : PhotoListStatus.normal(result)
//    }
    
//    //MARK:- リクエスト回数の管理
//    func current() -> Int {
//        return requestCount
//    }
//    
//    func reset() {
//        requestCount = 1
//    }
//    
//    func incement() {
//        requestCount += 1
//    }
//    
//    func updateTotal(total: Int) {
//        self.totalCount = total
//    }
//    
//    func isMoreRequest() -> Bool{
//        return totalCount > requestCount * PhotoSearchParamsBuilder.perPage
//    }
}
