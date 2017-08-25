//
//  SingleGifViewController.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/22.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

private let cellColumns = 3
private let cellMargin: CGFloat = 10.0
private let cellScale:CGFloat = 100.0 / 140.0

private let cellID = "SingleGifCell"
private let sectionID = "SingleGifSectionView"
private let columnCellID = "columnCell"

class SingleGifViewController: BaseViewController {

    
    fileprivate var headerReferenceSize: CGSize?
    fileprivate var selectedColumnRow = 0
    fileprivate var isSekectedColum = false
    override func viewDidLoad() {
        super.viewDidLoad()
      setupUI()

        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        setupUIFrame()
    }
    // 视图
    fileprivate func setupUI() {
       automaticallyAdjustsScrollViewInsets = false
    
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        view.addSubview(collectionView)
    
    
    
    
    }
    // 适配
    fileprivate func setupUIFrame() {
    
        let scale:CGFloat = 0.25
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width * scale, height: view.bounds.height)
        collectionView.frame = CGRect(x: tableView.frame.maxX, y: 0, width: view.bounds.width * (1 - scale) , height: view.bounds.height)
    }
    
    
    fileprivate lazy var collectionView: UICollectionView = {
    
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout:SingleGifCollectionFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "SingleGifCell", bundle: nil), forCellWithReuseIdentifier: cellID)
         collectionView.register(UINib(nibName: "SingleGifSectionView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: sectionID)
        
        
        let section = Bundle.main.loadNibNamed("SingleGifSectionView", owner: self, options: nil)?.last
        let collectionViewLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    
        self.headerReferenceSize = collectionViewLayout.headerReferenceSize

        return collectionView
    }()
    
    fileprivate lazy var tableView: UITableView = {
    
        let tableView = UITableView(frame:CGRect.zero,style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Color_GlobalBackground
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.sectionFooterHeight = 0.0001
        tableView.sectionHeaderHeight = 0.0001
        tableView.register(UINib(nibName: "SingleGifColumnCell", bundle: Bundle.main), forCellReuseIdentifier: columnCellID)
    
        return tableView;
    }()
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}

// collection的代理方法
extension SingleGifViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 18
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SingleGifCell

        
        if  !isSekectedColum && selectedColumnRow != indexPath.section {
           
            self.selectedColumnRow = indexPath.section
            
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: indexPath.section,section:0), at: .top, animated: true)
          
        }
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         let sectionView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: sectionID, for: indexPath) as! SingleGifSectionView
        return sectionView

    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(CommonGoodsFeedViewController(), animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - (cellMargin * CGFloat(cellColumns + 1))) / CGFloat(cellColumns)
        
        let height = width / cellScale
        return CGSize(width: width,height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsetsMake(0, cellMargin, 0, cellMargin)
        }
        
        return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize.zero
        }
        
        return headerReferenceSize!
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isSekectedColum = !scrollView.isKind(of: UICollectionView.self)
    }

}

// uitableView 的代理方法
extension SingleGifViewController : UITableViewDelegate,UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: columnCellID) as! SingleGifColumnCell
        cell.changeStatus(indexPath.row == selectedColumnRow ? true : false)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isSekectedColum = true
        selectedColumnRow = indexPath.row
        tableView.reloadData()
        // 滚动的商品列表
        collectionView.scrollToItem(at: IndexPath(row:0,section:indexPath.row), at: UICollectionViewScrollPosition.top, animated: true)
        
        
        
    }



}



// MARK: - 其他类
class SingleGifCollectionFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        minimumInteritemSpacing = cellMargin * 0.5
        minimumLineSpacing = cellMargin
        scrollDirection = UICollectionViewScrollDirection.vertical
    }
}

/// 分组头部
class SingleGifSectionView: UICollectionReusableView {
    
}

