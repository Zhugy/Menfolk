//
//  VideoServiceManage.swift
//  Menfolk
//
//  Created by zhugy on 2018/1/15.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class VideoServiceManage: NSObject {

    static func loadData(channelID: String, videoType: String, handler: @escaping (BSModel?) -> Void) {
        Alamofire.request("http://s.budejie.com/topic/list/jingxuan/41/bs0315-iphone-4.5.7/0-20.json").responseJSON { (resp) in
            switch resp.result {
            case .success(let json):
                
                if let model: BSModel = Mapper<BSModel>().map(JSONObject: json) {
                    handler(model)
                } else {
                    handler(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                handler(nil)
            }
        }
    }
        
    static func loadVidewSize(videos: [VideoModel]) -> [CGSize] {
        var sizes: [CGSize] = []
        
        for video in videos {
            if let videoInfo = video.videoInfo, videoInfo.width < videoInfo.height {
                let width: CGFloat = UIScreen.main.bounds.size.width / 2.0 - 10.0
                let height = width * (videoInfo.height / videoInfo.width)
                let size: CGSize = CGSize(width: width, height: height)
                sizes.append(size)
            } else {
                sizes.append(CGSize(width: UIScreen.main.bounds.size.width/2 - 10, height: UIScreen.main.bounds.size.width/2 - 10))
            }
        }
        return sizes
    }
}
