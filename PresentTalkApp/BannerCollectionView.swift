//
//  BannerCollectionView.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/7.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

private let cellResuseIndentifier = "BannerCell"

class BannerCollectionView: UICollectionView {

    private static var __once: () = {
    
    }()
    
    struct Static {
        
        static var dispatchOnceToken: Int = 0
        
    }
  
    //重写init方法
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
         super.init(frame: frame, collectionViewLayout: layout)
        
        
        
        
    }
    // 重写父类的 layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 构建UI 
    fileprivate func setUpUI() {
        backgroundColor = Color_GlobalBackground
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        isPagingEnabled = true
        delegate = self
        dataSource = self
        register(UINib(nibName:"BannerCell",bundle: nil), forCellWithReuseIdentifier: cellResuseIndentifier)
        
    
        
    
    }
    
    
    
    // MARK: - 赖加载
    fileprivate lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor(white: 0,alpha: 0.1)
        pageControl.numberOfPages = 4;
        return pageControl
    }()

}

extension BannerCollectionView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    // 返回section的个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 100
    }
    
    // 返回一组中有几个cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    // 返回cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellResuseIndentifier, for: indexPath)
        return cell
    }
    
    // 每个item 的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 300.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let tabBarViewController = UIApplication.shared.keyWindow?.rootViewController as! TabBarViewController
        let navigationController = tabBarViewController.viewControllers![tabBarViewController.selectedIndex] as! NavigationViewController
        navigationController.pushViewController(CommonStrategyViewController(), animated: true)
   
    }

}

extension BannerCollectionView: UIScrollViewDelegate {
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x
        let page = (contentOffsetX / scrollView.frame.size.width + 0.5).truncatingRemainder(dividingBy: CGFloat(4))
        pageControl.center.x = contentOffsetX + (ScreenWidth * 0.5)
        pageControl.currentPage = NSInteger(page)
    }


}


class BannerFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        
        super.prepare()
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = UICollectionViewScrollDirection.horizontal
        
    }
}







