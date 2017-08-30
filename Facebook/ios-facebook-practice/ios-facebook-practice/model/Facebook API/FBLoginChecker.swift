//
//  FBLoginChecker.swift
//  ios-facebook-practice
//
//  Created by 江本匠 on 2017/08/30.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin

final class FBLoginChecker {
    
    // MARK: - Facebook Login status
    func isLoggedInWithFacebook() -> Bool {
        let loggedIn = AccessToken.current != nil
        return loggedIn
    }
}
