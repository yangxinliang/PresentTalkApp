//
//  ColumnListViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/22.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

/// 顶部封面图高度
private let showImageHeight:CGFloat = 150.0
private let cellID = "ColumnListCell"
class ColumnListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

    
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUIFrame()
    }
    
    
    fileprivate func setupUI () {
        
        automaticallyAdjustsScrollViewInsets = false
        
        view.addSubview(tableView)
        navBarView.addSubview(titleLabel)
        view.addSubview(navBarView)
        view.addSubview(backBtn)
        
        
    }
    
    fileprivate func setupUIFrame() {
        // 导航栏
        navBarView.frame = CGRect(x: 0,y: 0, width: ScreenWidth, height: 64.0)
        backBtn.frame = CGRect(x: 10.0,y: 15.0, width: 44,height: 44)
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x:(navBarView.bounds.width - titleLabel.bounds.width) * 0.5, y: (navBarView.bounds.height - titleLabel.bounds.height) * 0.5 + 5.0, width: titleLabel.bounds.width, height: titleLabel.bounds.height)
        
        // tableView
        tableView.frame = view.bounds
        tableViewHeader.bounds = CGRect(x: 0,y: 0, width: tableView.bounds.width, height: 250.0)
        tableViewSection.bounds = CGRect(x: 0,y: 0,width: tableView.bounds.width,height: 50.0)
  
    
    }
    // MARK: - 事件
    @objc fileprivate func backBtnAction() {
    
    
    
    }
    
    // MARK: - 赖加载
    
    fileprivate lazy var navBarView: UIView = {
    
        let navBarView = UIView()
        navBarView.backgroundColor = Color_NavBackground
        navBarView.alpha = 0.0
        return navBarView
    }()
    
    fileprivate lazy var backBtn: UIButton = UIButton(backTarget: self, action: #selector(ColumnListViewController.backBtnAction))
    
    
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLab = UILabel()
        titleLab.text = "不打烊的礼物店"
        titleLab.textColor = UIColor.white
        titleLab.font = UIFont.systemFont(ofSize: 17.0)
        titleLab.textAlignment = NSTextAlignment.center
        return titleLab
    }()
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame:CGRect.zero,style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Color_GlobalBackground
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.sectionFooterHeight = 0.001
        tableView.sectionHeaderHeight = 0.001
        tableView.tableHeaderView = self.tableViewHeader
        
        tableView.register(UINib(nibName: "ColumnListCell", bundle:
            Bundle.main), forCellReuseIdentifier: cellID)
        
        return tableView;
    }()
    
    fileprivate lazy var tableViewHeader: UIView = ColumnListHeader.columnListHeader()
    fileprivate lazy var tableViewSection :UIView=Bundle.main.loadNibNamed("ColumnListSectionView", owner: nil, options: nil)!.last as! UIView
    

}


extension ColumnListViewController : UITableViewDelegate,UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableViewSection
    }



}

extension ColumnListViewController : UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        navBarView.alpha = offsetY / (showImageHeight - navBarView.bounds.height)
    }



}







