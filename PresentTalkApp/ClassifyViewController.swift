//
//  ClassifyViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 17/4/14.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class ClassifyViewController: BaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.resignFirstResponder()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupUIFrame()
        
    }
    // 视图
    fileprivate func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = Color_GlobalBackground
        navigationItem.titleView = titleView
        navigationItem.rightBarButtonItem = UIBarButtonItem(chooseGifTarget: self, action: #selector(ClassifyViewController.SearchGifBtnAction))
        navigationItem.rightBarButtonItem?.customView?.alpha = 0
        view.addSubview(searchBar)
        view.addSubview(scrollView)
        scrollView.addSubview(strategyVC.view)
        scrollView.addSubview(singleGifVC.view)
        addChildViewController(strategyVC)
        addChildViewController(singleGifVC)
    
    }
    fileprivate func setupUIFrame() {
        titleView.frame = CGRect(x: 0, y: 0, width: 120.0,height: 44.0)
        searchBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 44.0)
        
        scrollView.frame = CGRect(x: 0, y:searchBar.frame.maxY, width: view.bounds.width, height: view.bounds.height - searchBar.bounds.height - 44.0)
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * 2.0, height: scrollView.bounds.height)
        strategyVC.view.frame = scrollView.bounds
        strategyVC.view.backgroundColor = UIColor.red
        singleGifVC.view.frame =  CGRect(x: scrollView.frame.width, y: 0, width:scrollView.bounds.width, height: scrollView.bounds.height)
    
    
    }
    // MARK: - 事件
    @objc fileprivate func SearchGifBtnAction() {
//        navigationController?.pushViewController(SearchGifViewController(), animated: true)
    }
    
    fileprivate lazy var titleView: ClassifyTitleView = {
        let view = ClassifyTitleView()
        view.delegate = self
        return view
    }()
    
    fileprivate lazy var searchBar: UISearchBar = UISearchBar(searchGifdelegate: self, backgroudColor: UIColor(white: 0, alpha: 0.05),backgroundImage:UIImage.imageWithColor(UIColor.white, size: CGSize.zero))
    

    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    fileprivate lazy var strategyVC: StrategyViewController = StrategyViewController()
    fileprivate lazy var singleGifVC: SingleGifViewController = SingleGifViewController()
    
    
   
}
extension ClassifyViewController: ClassifyTitleViewDelegate ,UISearchBarDelegate,UIScrollViewDelegate{
    // MARK: classifyTileViewDelegate
    func selectedOptionAtIndex(_ index: NSInteger) {
        scrollView.setContentOffset(CGPoint(x: CGFloat(index) * scrollView.bounds.width,y: 0), animated: true)
    }
    
    
    
    
    // MARK: UISearchBarDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        navigationItem.rightBarButtonItem?.customView?.alpha = scrollView.contentOffset.x / scrollView.bounds.width
        // 更改titleView的底部线条
        titleView.scrollLine(scrollView.bounds.width, offsetX: scrollView.contentOffset.x)
    }




}



