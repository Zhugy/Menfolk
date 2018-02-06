//
//  RootViewController.swift
//  Menfolk
//
//  Created by zhugy on 2018/1/15.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
        crearViewControll()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func crearViewControll() {
        
        var controllers: [UINavigationController] = []
        var imageNames : [UIImage] = []
        var selectedImageNames : [UIImage] = []
        var titles : [String] = []
        
        let basetPart: BestPartViewController = BestPartViewController()
        imageNames.append(#imageLiteral(resourceName: "home"))
        selectedImageNames.append(#imageLiteral(resourceName: "home_s"))
        titles.append("精华")
        controllers.append(UINavigationController.init(rootViewController: basetPart))
        
        let news: NewsViewController = NewsViewController()
        imageNames.append(#imageLiteral(resourceName: "home"))
        selectedImageNames.append(#imageLiteral(resourceName: "home_s"))
        titles.append("最新")
        controllers.append(UINavigationController.init(rootViewController: news))
        
        let write: WriteViewController = WriteViewController()
        imageNames.append(#imageLiteral(resourceName: "home"))
        selectedImageNames.append(#imageLiteral(resourceName: "home_s"))
        titles.append("")
        controllers.append(UINavigationController.init(rootViewController: write))
        
        let community: CommunityViewController = CommunityViewController()
        imageNames.append(#imageLiteral(resourceName: "home"))
        selectedImageNames.append(#imageLiteral(resourceName: "home_s"))
        titles.append("社区")
        controllers.append(UINavigationController.init(rootViewController: community))
        
        let mine: MineViewController = MineViewController()
        imageNames.append(#imageLiteral(resourceName: "home"))
        selectedImageNames.append(#imageLiteral(resourceName: "home_s"))
        titles.append("我")
        controllers.append(UINavigationController.init(rootViewController: mine))
        
        for i in 0 ..< controllers.count {
            let item: UITabBarItem = UITabBarItem(title: titles[i], image: imageNames[i].withRenderingMode(.alwaysOriginal), selectedImage: selectedImageNames[i].withRenderingMode(.alwaysOriginal))
            item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: .normal)
            item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.red], for: .selected)
            controllers[i].tabBarItem = item
        }
        
        self.viewControllers = controllers
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
