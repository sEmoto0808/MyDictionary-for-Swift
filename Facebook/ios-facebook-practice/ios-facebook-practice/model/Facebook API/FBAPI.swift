//
//  FBAPI.swift
//  ios-facebook-practice
//
//  Created by 江本匠 on 2017/08/30.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import FacebookCore
import FacebookLogin

final class FBAPI {
    
    // MARK: - Facebook Login
    func login(vc: UIViewController) {
        
        LoginManager().logIn([.email], viewController: vc, completion: {
            result in
            switch result {
            case let .success( permission, declinePemisson, token):
                print("token:\(token),\(permission),\(declinePemisson)")
            case let .failed(error):
                print("error:\(error)")
            case .cancelled:
                print("cancelled")
            }
            
        })
    }
    
    func logout() {
        
        LoginManager().logOut()
    }
    
    // MARK: - Facebook Get UserInfo
    func getUserInfo() {
        
        GraphRequest(graphPath: "me", parameters: ["fields": "name, email"], accessToken: AccessToken.current, httpMethod: .GET, apiVersion: GraphAPIVersion.defaultVersion).start({
            response, result in
            switch result {
            case .success(let response) :
                print("response:\(response)")
                break
            case .failed(let error):
                print("error:\(error.localizedDescription)")
                
            }
            
        })
    }
}
