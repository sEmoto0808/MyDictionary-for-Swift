//
//  NetworkChecker.swift
//  01_API
//
//  Created by 江本匠 on 2017/08/08.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Alamofire

final class NetworkChecker {
    
    // ネットワーク接続状況確認
    //
    // - Returns: true  -> online
    //            false -> offline
    static func isOnline() -> Bool {
        
        let networkReachability = NetworkReachabilityManager()
        networkReachability?.startListening()
        
        return networkReachability?.isReachable ?? false
    }
}
