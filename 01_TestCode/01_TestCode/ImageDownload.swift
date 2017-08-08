//
//  ImageDownload.swift
//  01_TestCode
//
//  Created by 江本匠 on 2017/08/09.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import UIKit

// Modelクラス (非同期処理サンプル)
class ImageDownload: NSObject {
    
    func fetchImage(urlString: String,
                    completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
}
