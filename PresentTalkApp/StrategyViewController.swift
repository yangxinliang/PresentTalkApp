//
//  StrategyViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/16.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit


private let cellCollumns = 2
private let cellMargin: CGFloat = 10.0
private let columnCellHeight: CGFloat = 250.0
private let cellScale: CGFloat = 200.0 / 100.0

private let categoryCellID = "StrategyCategoryCell"

private let columnCellID = "StrategyColumnCell"

private let sectionID = "StrategySectionView"

class StrategyViewController: BaseViewController {

    
    fileprivate var headerReferenceSize : CGSize?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // 设置view的frame
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
  
    // 定制UI
    fileprivate func setUpUI() {
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
//        view.addSubview(coll)
    
    
    
    }
    
    fileprivate func setupUIFrame() {
    
    
    
    
    }
    
    // 懒加载
    fileprivate lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame:CGRect.zero, collectionViewLayout: StrategyCollectionFlowLayout())
            collection.delegate = self
            collection.dataSource = self
            collection.backgroundColor = UIColor.white
            collection.showsHorizontalScrollIndicator = false
            collection.showsVerticalScrollIndicator = false
        
    
    
    
    
    
        return collection
    }()
    
    
    
    
  

}
extension StrategyViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: columnCellID, for: indexPath)
            
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath)
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width,height: columnCellHeight)
            
        }
        let width = (collectionView.bounds.width - (cellMargin * CGFloat(cellCollumns + 1))) / CGFloat(cellCollumns)
        let height = width / cellScale
        
        return CGSize(width: width,height:height)
     
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            return UIEdgeInsetsMake(0, cellMargin, 0, cellMargin)
        }
        return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin)
        
    }
    
    
    
    
}

// 分组头部
class StrategySectionView: UICollectionReusableView {
    
    @IBOutlet weak var marginTopView: UIView!
    
    @IBOutlet weak var viewAllBtn: UIButton!
    
    func hideMarginTopView(_ hide: Bool) {
        marginTopView.isHidden = hide
    }
    
    @IBAction func viewAllBtnAction(_ sender: Any) {
        
        
    
        
    }
    
    
    
}




// 其他的类
class StrategyCollectionFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        minimumInteritemSpacing = cellMargin * 0.5
        minimumLineSpacing = cellMargin
        scrollDirection = UICollectionViewScrollDirection.vertical
        
        
    }
    
    
}






