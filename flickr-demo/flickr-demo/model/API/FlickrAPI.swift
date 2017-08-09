//
//  FlickrAPI.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/10.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import ObjectMapper

final class PhotoSearchAPI {
    
    var loadable: PhotoSearchLoadable?
    fileprivate var isLoading = false
    private var requestCount = 1
    private var totalCount = 1
    
    func waiting() -> Bool {
        return isLoading
    }
    
    func load(tags: String) {
        
        guard NetworkChecker.isOnline() else {
            self.loadable?.setStatus(status: .offline)
            return
        }
        
        isLoading = true
        
        let router = APIRouter.PhotosSearch(
            PhotoSearchParamsBuilder.create(tags: tags, page: current()))
        
        APIClient().request(router:router) { [weak self](response) -> () in
            
            switch response {
            case .success(let result):
                
                if let searchResult = Mapper<PhotoSearchResult>().map(JSONObject: result) {
                    let status = self?.hasPhotoList(result: searchResult) ?? .none
                    self?.loadable?.setStatus(status: status)
                }
                
            case .failure( _):
                self?.loadable?.setStatus(status: .error)
            }
            self?.isLoading = false
        }
    }
    
    private func hasPhotoList(result: PhotoSearchResult) -> PhotoListStatus{
        
        return (result.photos.count == 0) ?
            PhotoListStatus.noData : PhotoListStatus.normal(result)
    }
    
    //MARK:- リクエスト回数の管理
    func current() -> Int {
        return requestCount
    }
    
    func reset() {
        requestCount = 1
    }
    
    func incement() {
        requestCount += 1
    }
    
    func updateTotal(total: Int) {
        self.totalCount = total
    }
    
    func isMoreRequest() -> Bool{
        return totalCount > requestCount * PhotoSearchParamsBuilder.perPage
    }
}
