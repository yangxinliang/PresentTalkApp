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
        setUpUI()
    }

    // 设置view的frame
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUIFrame()
    }
  
    // 定制UI
    fileprivate func setUpUI() {
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
    
    }
    
    fileprivate func setupUIFrame() {
    
        collectionView.frame = view.bounds
    
    }
    
    // 懒加载
    fileprivate lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame:CGRect.zero, collectionViewLayout: StrategyCollectionFlowLayout())
            collection.delegate = self
            collection.dataSource = self
            collection.backgroundColor = UIColor.white
            collection.showsHorizontalScrollIndicator = false
            collection.showsVerticalScrollIndicator = false
            collection.register(UINib(nibName: "StrategyColumnCell",bundle:nil), forCellWithReuseIdentifier: columnCellID)
            collection.register(UINib(nibName: "StrategyCategoryCell", bundle: nil), forCellWithReuseIdentifier: categoryCellID)
            collection.register(UINib(nibName: "StrategySectionView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: sectionID)
            let section = Bundle.main.loadNibNamed("StrategySectionView", owner: self, options: nil)?.last!
            let ceollectionLayout = collection.collectionViewLayout as! UICollectionViewFlowLayout
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: columnCellID, for: indexPath) as! StrategyColumnCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath) as! StrategyCategoryCell
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: sectionID, for: indexPath) as! StrategySectionView
        sectionView.hideMarginTopView(indexPath.section == 0 ? true : false)
        sectionView.viewAllBtn.tag = indexPath.section
        return sectionView

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(CommonStrategyViewController(), animated: true)
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
        let tabBarViewController = UIApplication.shared.keyWindow?.rootViewController as! TabBarViewController
        let navigationController = tabBarViewController.viewControllers![tabBarViewController.selectedIndex] as! UINavigationController
        navigationController.pushViewController((sender as AnyObject).tag == 0 ? AllColumnViewController() : AllClassifyViewController(), animated: true)
    
        
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






