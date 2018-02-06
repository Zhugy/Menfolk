//
//  BestPartViewController.swift
//  Menfolk
//
//  Created by zhugy on 2018/1/15.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit
import Cartography

class BestPartViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    private let pageViewControlelr: UIPageViewController = {
        let controlelr = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return controlelr
    }()
    
    
    
    private let viewControlls: [UIViewController] = {
        return [CommonViewController(), VideoViewController(), CommonViewController(),VideoViewController(), CommonViewController(), VideoViewController()]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatPageViewController()
        VideoServiceManage.loadData(channelID: "", videoType: "") { (error) in
            
        }
    }

    private func creatPageViewController() {
        addChildViewController(pageViewControlelr)
        view.addSubview(pageViewControlelr.view)
        pageViewControlelr.delegate = self
        pageViewControlelr.dataSource = self
        
        pageViewControlelr.setViewControllers([viewControlls.first ?? CommonViewController()], direction: .reverse, animated: false, completion: nil)
        
        constrain(pageViewControlelr.view) { (pageView) in
            pageView.top == pageView.superview!.top + 64
            pageView.leading == pageView.superview!.leading
            pageView.trailing == pageView.superview!.trailing
            pageView.bottom == pageView.superview!.bottom - 49
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = indexWith(at: viewController)
        if index == 0 || index == NSNotFound {
            return nil
        }
        index = index - 1
        return viewControlls[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexWith(at: viewController)
        if index == NSNotFound {
            return nil
        }
        index = index + 1
        if index == viewControlls.count {
            return nil
        }
        return viewControlls[index]
    }
    
    
    func viewController(at index: Int) -> UIViewController? {
        if viewControlls.count == 0 || index >= viewControlls.count {
            return nil
        }
        return viewControlls[index]
    }
    
    func indexWith(at controller: UIViewController) -> Int {
        return viewControlls.index(of: controller) ?? NSNotFound
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
