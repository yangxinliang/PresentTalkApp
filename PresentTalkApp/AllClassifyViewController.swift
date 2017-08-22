//
//  AllClassifyViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/22.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

private let cellColumns = 2
private let cellMargin:CGFloat = 10.0
private let columnCellHeight:CGFloat = 250.0
private let cellScale:CGFloat = 200.0 / 100.0 /// cellxib宽高比例
private let categoryCellID = "StrategyCategoryCell"
class AllClassifyViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpUIFrame()
    }
    
    fileprivate func setUpUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
    
    }
    
    fileprivate func setUpUIFrame() {
    
        collectionView.frame = view.bounds;
    
    }
    
    // 赖加载
    
    fileprivate lazy var collectionView : UICollectionView = {
    
        let collectionView = UICollectionView(frame:CGRect.zero,collectionViewLayout: AllClassifyCollectionFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName:"StrategyCategoryCell",bundle:nil), forCellWithReuseIdentifier: categoryCellID)
    
        return collectionView;
    
    }()
    
    
    

}


extension AllClassifyViewController :UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath) as! StrategyCategoryCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(CommonStrategyViewController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - (cellMargin * CGFloat(cellColumns + 1))) / CGFloat(cellColumns)
        let height = width / cellScale
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin);
    }
 
 




}

// MARK: - 其他类
class AllClassifyCollectionFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        minimumInteritemSpacing = cellMargin * 0.5
        minimumLineSpacing = cellMargin
        scrollDirection = UICollectionViewScrollDirection.vertical
    }
}



