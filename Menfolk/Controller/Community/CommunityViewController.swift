//
//  CommunityViewController.swift
//  Menfolk
//
//  Created by zhugy on 2018/1/15.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit
import Cartography

class CommunityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }

    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        constrain(tableView) { (tableView) in
            tableView.edges == tableView.superview!.edges
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "Cell"
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        cell.textLabel?.text = "我是Demo"
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
