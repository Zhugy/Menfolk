//
//  VideoViewController.swift
//  Menfolk
//
//  Created by zhugy on 2018/1/15.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit
import Cartography

class VideoViewController: UIViewController {

    private var collectView: UICollectionView!
    
    private var videos: [VideoModel] = []
    private var videoSizes:[CGSize] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let layout = GYVideoLayout()
        layout.delegate = self
        collectView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectView.backgroundColor = UIColor.white
        view.addSubview(collectView)
        collectView.delegate = self
        collectView.dataSource = self
        collectView.register(BSVideoCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(BSVideoCell.classForCoder()))
        
        constrain(collectView) { (collectView) in
            collectView.edges == collectView.superview!.edges
        }
        
        loadData()
    }

    func loadData() {
        VideoServiceManage.loadData(channelID: "", videoType: "") { [weak self](bsModel) in
            guard let strongSelf = self else {
                return
            }
            guard let model = bsModel else {
                return
            }
            strongSelf.videos = model.videos
            strongSelf.videoSizes = VideoServiceManage.loadVidewSize(videos: strongSelf.videos)
            strongSelf.collectView.reloadData()
            
        }
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension VideoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, GYVideoLayoutDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(BSVideoCell.classForCoder()), for: indexPath) as! BSVideoCell
        let model = videos[indexPath.row]
        
        if let videoInfo = model.videoInfo, videoInfo.width < videoInfo.height {
            cell.imageStr = model.videoInfo?.thumbnail.first ?? ""
        } else {
            cell.imageStr = model.videoInfo?.thumbnail_small.first ?? ""
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return videoSizes[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func waterFlow(_ WaterFlowLayout: GYVideoLayout!, heightForRowAtIndexPath index: Int, itemWidth: CGFloat) -> CGFloat {
        return videoSizes[index].height
    }
    
    
}
