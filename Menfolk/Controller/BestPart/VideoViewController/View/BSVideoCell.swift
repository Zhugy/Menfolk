//
//  BSVideoCell.swift
//  Menfolk
//
//  Created by zhugy on 2018/1/16.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit
import Cartography
import SDWebImage

class BSVideoCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    var imageStr: String = "" {
        didSet {
            imageView.sd_setImage(with: URL.init(string: imageStr)!) { (image, error, type, url) in
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        constrain(imageView) { (imageView) in
            imageView.edges == imageView.superview!.edges
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
