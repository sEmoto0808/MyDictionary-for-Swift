//
//  TimeLine.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import Social
import Accounts
import ObjectMapper

enum TimeLineStatus {
    case initialize
    case loading
    case loaded([Tweet])
    case offline
    case error(message: String)
}

protocol TimeLineLoadable: class {
    func setResult(result: TimeLineStatus)
}

final class TimeLine {
    
    weak var loadable: TimeLineLoadable?
    
    func getList(myAccount: ACAccount) {
        let url = URL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json")
        
        guard NetworkChecker.isOnline() else {
            loadable?.setResult(result: .offline)
            return
        }
        
        let request = SLRequest(forServiceType: SLServiceTypeTwitter,
                                requestMethod: .GET,
                                url: url,
                                parameters: nil)
        request?.account = myAccount
        
        request?.perform { (responseData, response, error) -> Void in
            if error != nil {
                print("error")
            } else {
                do {
                    let result = try JSONSerialization.jsonObject(with: responseData!,options: .allowFragments)
                    if let items = Mapper<Tweet>().mapArray(JSONObject: result) {
                        print("success value")
                        self.loadable?.setResult(result: .loaded(items))
                    }
                    
                }  catch let error as NSError {
                    print(error)
                }
            }
        }
    }
}
