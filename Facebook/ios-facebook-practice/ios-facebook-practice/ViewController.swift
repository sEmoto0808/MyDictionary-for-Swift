//
//  ViewController.swift
//  ios-facebook-practice
//
//  Created by 江本匠 on 2017/08/29.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(String(describing: Bundle.main.bundleIdentifier))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

extension ViewController {
    
    // MARK: - Facebook Login
    func isLoggedInWithFacebook() -> Bool {
        let loggedIn = AccessToken.current != nil
        return loggedIn
    }
    
    // MARK: - Facebook Get UserInfo
    func getUserInfo (){
        
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
    
    // MARK: - @IBAction
    @IBAction func didTapLogin(_ sender: Any) {
        
        LoginManager().logIn([.email], viewController: self, completion: {
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
    
    @IBAction func didTapLogout(_ sender: Any) {
        
        LoginManager().logOut()
    }
}
