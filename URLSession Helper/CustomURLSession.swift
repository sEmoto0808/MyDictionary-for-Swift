//
//  CustomURLSession.swift
//  ios-iTunesSearch-practice
//
//  Created by 江本匠 on 2017/09/11.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation
import UIKit
import STV_Extensions

final class CustomURLSession {
    
    func getBy(model: Song, url: String, view: UIImageView) {
        
        guard let url = URL(string: url) else { return }
        
        let urlRequest = URLRequest(url: url)
        let urlSessionConfig = URLSessionConfiguration.default
        urlSessionConfig.timeoutIntervalForRequest = 30.0
        urlSessionConfig.timeoutIntervalForResource = 60.0
        
        let urlSession = URLSession(configuration: urlSessionConfig)
        
        urlSession.dataTask(with: urlRequest) { data, _, error in
            
            if let error = error {
                
                Logger.error(message: "Failed to download icon.\n->\(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                view.image = UIImage(data: data)
                let songInfo = SongInfo()
                songInfo.songId = model.trackId
                songInfo.iconImage = data
                SongInfoDao().add(model: songInfo)
            }
            }.resume()
    }
}
