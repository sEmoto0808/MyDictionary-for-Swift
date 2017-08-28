//
//  TimeLineViewController.swift
//  ios-TwitterClient-sk9
//
//  Created by 江本匠 on 2017/08/26.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit
import Accounts
import Social
import SVProgressHUD
import STV_Extensions

class TimeLineViewController: UIViewController {

    @IBOutlet weak var timelineTableView: UITableView!
    
    fileprivate let timelineAPI = TimeLine()
    fileprivate let datasource = TimeLineProvider()
    fileprivate let userInfoDao = UserInfoDao()
    fileprivate let userCheck = CheckSameUser()
    fileprivate let accountCheck = AccountChecker()
    
    fileprivate var offlineAlert: UIAlertController?
    fileprivate var refresh = UIRefreshControl()
    fileprivate var accountStore:ACAccountStore = ACAccountStore()
    fileprivate var twAccount = ACAccount()
    fileprivate var accounts = [ACAccount]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

// MARK: - TimeLineLoadable
extension TimeLineViewController: TimeLineLoadable {
    
    func setResult(result: TimeLineStatus) {
        print("finish")
        SVProgressHUD.dismiss()
        
        switch result {
        case .loaded(let response):
            print("loaded")
            datasource.set(timelines: response)
            
            // MARK: - User Info for Realm
            let saveUserLists = userCheck.isNotSame(list: response)
            for user in saveUserLists {
                userInfoDao.add(name: user.name, imageURL: user.profileImage)
            }
            
        case .offline:
            print("offline")
            showOfflineAlert()
            
        case .error(message: let message):
            print("error")
            Logger.debug(message: message)
            
        default:
            print("default")
            Logger.debug(message: "default")
        }
    }
}

// MARK: - OfflineAlertHelperDelegate
extension TimeLineViewController: OfflineAlertHelperDelegate {
    func didTapOKButton() {
        Logger.debug(message: "OK")
    }
}

extension TimeLineViewController {
    
    func setup() {
        timelineTableView.dataSource = datasource
        
        getAccount()
        loadTimeLine()
        setRefresh()
    }
    
    func loadTimeLine() {
        SVProgressHUD.show()
        timelineAPI.loadable = self
        timelineAPI.getList(myAccount: self.twAccount)
    }
    
    // MARK: - Twitter Account
    func getAccount() {
        
        let accountType: ACAccountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccounts(with: accountType, options: nil) { (success, error) in
            
            if error != nil {
                print("Error: failed get accounts")
            }
            if !success {
                print("Error: not allow access")
            }
            // リクエストが成功した時
            self.accounts += self.accountStore.accounts(with: accountType) as! [ACAccount]
            self.twAccount = self.accounts[0]
            if self.accounts.count == 0 {
                self.accountCheck.hasNoAccount()
            }
        }
        
        print("after acc: \(self.accountStore.accounts(with: accountType))")
    }
    
    // MARK: - Alert
    func showOfflineAlert() {
        if let alert = OfflineAlertHelper().alert(delegate: self) {
            present(alert, animated: true) { self.offlineAlert = nil }
        }
    }
    
    // MARK: - Pull to Refresh
    func setRefresh() {
        refresh.attributedTitle = NSAttributedString(string: "REFRESH_MESSAGE".localized())
        refresh.addTarget(self, action: #selector(TimeLineViewController.refreshTimeLine), for: UIControlEvents.valueChanged)
        timelineTableView.addSubview(refresh)
    }
    
    func refreshTimeLine() {
        loadTimeLine()
        refresh.endRefreshing()
    }
}
