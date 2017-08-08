//
//  BaseStrategyFeedController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/5.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

private let cellReuseIdentifiler = "BaseStrategyCell"

class BaseStrategyFeedController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        setUpUI()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpUIFrame()
    }
    
    
    
    // MARK: - 视图
    fileprivate func setUpUI() {
    
      view.addSubview(tableView)
      
    
    }

    
    fileprivate func setUpUIFrame() {
     tableView.frame = view.bounds
    
    }
    
    lazy var tableView: UITableView = {
        let tableView =  UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Color_GlobalBackground
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.sectionFooterHeight = 0.0001
        tableView.sectionHeaderHeight = 0.0001
        tableView.register(UINib(nibName: "BaseStrategyCell", bundle: Bundle.main), forCellReuseIdentifier: cellReuseIdentifiler)
        return tableView;
    }()
    

}

extension BaseStrategyFeedController:UITableViewDataSource,UITableViewDelegate {



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifiler, for: indexPath)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
}





