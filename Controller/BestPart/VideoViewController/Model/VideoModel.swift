//
//  VideoModel.swift
//  Menfolk
//
//  Created by zhugy on 2018/1/15.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit
import ObjectMapper


class BSModel: Mappable {
    var videos: [VideoModel] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        videos <- map["list"]
    }    
}

class VideoModel: Mappable {
    var status: Int = 0
    var comment: String?
    var top_comments: [TopComments] = []
    var tags: [Tags] = []
    var bookmark: String?
    var titleStr: String?
    var up: String?
    var share_url: String?
    var down: Int = 0
    var forward: Int = 0
    var passtime: String?
    var type: String?
    var channelID: String?
    var userInfo: UserInfo?
    var videoInfo: VideoInfo?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        comment <- map["comment"]
        top_comments <- map["top_comments"]
        tags <- map["tags"]
        bookmark <- map["bookmark"]
        titleStr <- map["text"]
        up <- map["up"]
        share_url <- map["share_url"]
        down <- map["down"]
        forward <- map["forward"]
        passtime <- map["passtime"]
        type <- map["type"]
        channelID <- map["id"]
        userInfo <- map["u"]
        videoInfo <- map["video"]
    }
}


class TopComments: Mappable {
    var content: String?
    var like_count: Int = 0
    var hate_count: Int = 0
    var cmt_type: String?
    var userId: String?
    var name: String?
    var headerStr: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        content <- map["content"]
        like_count <- map["like_count"]
        hate_count <- map["hate_count"]
        cmt_type <- map["cmt_type"]
        userId <- map["id"]
        name <- map["name"]
        headerStr <- map["header"]
    }
}

class Tags: Mappable {
    var post_number: Int = 0
    var image_list: String?
    var forum_sort: Int = 0
    var forum_status: Int = 0
    var tagID: Int = 0
    var info: String?
    var name: String?
    var tail: String?
    var sub_number: Int = 0
    var display_level: Int = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        post_number <- map["post_number"]
        image_list <- map["image_list"]
        forum_sort <- map["forum_sort"]
        forum_status <- map["forum_status"]
        tagID <- map["id"]
        info <- map["info"]
        name <- map["name"]
        tail <- map["tail"]
        sub_number <- map["sub_number"]
        display_level <- map["display_level"]
    }
    
    
}

class UserInfo: Mappable {
    var header: [String] = []
    var uid: String?
    var is_vip: Bool = false
    var room_name: String?
    var room_role: String?
    var room_icon: String?
    var name: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        header <- map["header"]
        uid <- map["uid"]
        is_vip <- map["is_vip"]
        room_name <- map["room_name"]
        room_icon <- map["room_icon"]
        room_role <- map["room_role"]
        name <- map["name"]
    }
}

class VideoInfo: Mappable {
    var playfcount: Int = 0
    var height: CGFloat = 0.0
    var width: CGFloat = 0.0
    var video: [String] = []
    var download: [String] = []
    var duration: Int = 0
    var playcount: Int = 0
    var thumbnail: [String] = []
    var thumbnail_small: [String] = []
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        playcount <- map["playcount"]
        height <- map["height"]
        width <- map["width"]
        video <- map["video"]
        download <- map["download"]
        duration <- map["duration"]
        playcount <- map["playcount"]
        thumbnail <- map["thumbnail"]
        thumbnail_small <- map["thumbnail_small"]
    }
    
    
}
