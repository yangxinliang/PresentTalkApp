//
//  StrategyColumnCell.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/16.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

private let cellColumns = 3
private let cellMargin:CGFloat = 10.0
/// cellxib宽高比例
private let cellScale:CGFloat = 340.0 / 90.0
private let cellID = "StrategyColumnCellCell"

class StrategyColumnCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "StrategyColumnCellCell", bundle: nil), forCellWithReuseIdentifier: cellID)
    }

}

// 代理方法
extension StrategyColumnCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {


    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let tabBarViewController = UIApplication.shared.keyWindow?.rootViewController as! UITabBarController

        let navigationController = tabBarViewController.viewControllers![tabBarViewController.selectedIndex] as! NavigationViewController
        
        
        if indexPath.row == 14 {
//            navigationController.pushViewController(nil, animated: true)
            
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (collectionView.bounds.height - (cellMargin * CGFloat(cellColumns + 1))) / CGFloat(cellColumns)
        let width = height * cellScale
        
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin)
        
    }
    

}
