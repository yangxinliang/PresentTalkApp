//
//  BaseGoodsCell.swift
//  PresentTalkApp
//
//  Created by yangxinliang on 2017/8/8.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class BaseGoodsCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.layer.masksToBounds = true
        photoImageView.contentMode =  UIViewContentMode.scaleAspectFill;
        photoImageView.image = UIImage(named: "goods_\(Int(arc4random() % 10) + 1).jpg")
    
    
    }

}
