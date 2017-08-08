//
//  BannerCell.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/7.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class BannerCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoImageView.clipsToBounds = true
        photoImageView.contentMode =  UIViewContentMode.scaleAspectFill;
        photoImageView.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
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
