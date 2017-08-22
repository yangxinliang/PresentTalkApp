//
//  AllColumnViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/22.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

private let cellColumns = 1
private let cellMargin :CGFloat = 10.0

private let cellScale: CGFloat = 340.0 / 90.0
private let cellID = "StrategyColumnCellCell"

class AllColumnViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUP()
    }

    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // MARK: 视图
    fileprivate func setUP() {
    view.addSubview(collectionView)
    
    
    }
    // 视图适配
    fileprivate func setUIFrame() {
    
    
    collectionView.frame = view.bounds
    }
    
    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero,collectionViewLayout:AllColumnViewFlowLayout())
           collectionView.delegate = self
           collectionView.dataSource = self
           collectionView.backgroundColor = UIColor.white
           collectionView.register(UINib(nibName: "StrategyColumnCellCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        return collectionView
    
    }()
    
    
}

extension AllColumnViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! StrategyColumnCellCell
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - (CGFloat(cellColumns + 1) * cellMargin)
        let height = width / cellScale
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin);
    }
    



}


// MARK: - 其他类
class AllColumnViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        minimumInteritemSpacing = cellMargin * 0.5
        minimumLineSpacing = cellMargin
        scrollDirection = UICollectionViewScrollDirection.vertical
    }
}




