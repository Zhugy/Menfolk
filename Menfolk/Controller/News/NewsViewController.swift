//
//  NewsViewController.swift
//  Menfolk
//
//  Created by zhugy on 2018/1/15.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit
import Cartography

class NewsViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "功能"
        view.backgroundColor = UIColor.white
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let items: [Item] = [.POP, .banner, .AVPlayer]
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        constrain(tableView) { (tableView) in
            tableView.edges == tableView.superview!.edges
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "CellID"
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        cell.textLabel?.text = items[indexPath.row].title
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension NewsViewController {
    enum Item {
        case POP
        case banner
        case AVPlayer
        
        var title: String {
            switch self {
            case .POP:
                return "气泡弹层"
            case .banner:
                return "轮播视图"
            case .AVPlayer:
                return "AVPlayer"
            }
        }
        
    }
}
