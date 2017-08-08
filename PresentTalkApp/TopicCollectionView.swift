//
//  TopicCollectionView.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/7.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit
private let cellReCell = "cell"

private let cellMargin: CGFloat = 10.0

class TopicCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   //mark: -- 视图
    
    fileprivate func setUpUI() {
        backgroundColor = UIColor.white
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        isPagingEnabled = false
        delegate = self
        dataSource = self
        register(UINib(nibName:"TopicCell",bundle:nil), forCellWithReuseIdentifier: cellReCell)
    
    }
   
    
}

extension TopicCollectionView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    // 返回一个section的 item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
   // 返回cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReCell, for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100.0, height: 100.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tabBarViewController = UIApplication.shared.keyWindow?.rootViewController as! TabBarViewController
        let navigationController = tabBarViewController.viewControllers![tabBarViewController.selectedIndex] as! NavigationViewController
        navigationController.pushViewController(CommonStrategyViewController(), animated: true)
        
        
    }

}

