//
//  PhotoURLBuilder.swift
//  flickr-demo
//
//  Created by 江本匠 on 2017/08/10.
//  Copyright © 2017年 st-ventures.jp. All rights reserved.
//

import Foundation

final class PhotoURLBuilder {
    
    static func create(photo: Photo) -> String{
        
        return "https://farm\(photo.farm).staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
    }
}
