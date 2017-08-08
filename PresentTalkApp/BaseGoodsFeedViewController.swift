//
//  BaseGoodsFeedViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/8.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit


private let cellReuseIdentifir = "BaseGoodCell"
/// 列数
private let collectionViewRow = 2
// cell 间距
private let cellMarigon: CGFloat = 10.0

/// cell里除图片外的固定高度(适配了所有机型在展示的商品图片都为正方形)
private let fixedHeight: CGFloat = 78



class BaseGoodsFeedViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    // 构建UI
    fileprivate func setUpUI() {
        
        
        
    }
    
    // 设置frame
    fileprivate func setUpUIFrame() {
        
        
        
    }
    
    // mark: -赖加载
    lazy var collection: UICollectionView = {
        let collectionView = UICollectionView(frame:CGRect.zero,collectionViewLayout:BaseGoodsFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = Color_GlobalBackground
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        
        
        
        return collectionView
    }()
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
// mark : -- 实现collection的代理方法
extension BaseGoodsFeedViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    // 返回 setion 中items的个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    // 返回cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifir, for: indexPath)
        return cell
    }
    
    // cell 的点击方法
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    

    // 返回items 的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - (cellMarigon * CGFloat(collectionViewRow + 1))) / CGFloat(collectionViewRow)
        let height = width + fixedHeight
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(cellMarigon, cellMarigon, cellMarigon, cellMarigon)
    }

}




class BaseGoodsFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        
        minimumLineSpacing = cellMarigon
        minimumInteritemSpacing = cellMarigon * 0.5
        scrollDirection = UICollectionViewScrollDirection.vertical
        
    }
    
    
}





