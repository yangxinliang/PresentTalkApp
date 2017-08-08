//
//  TopicCell.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/7.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit
private let cellMargin: CGFloat = 10.0

class TopicCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.clipsToBounds = true
        photoImageView.contentMode =  UIViewContentMode.scaleAspectFill;
        photoImageView.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
    }

}
class TopicFlowLayout: UICollectionViewFlowLayout {
    
    
    override func prepare() {
        
        super.prepare()
        minimumInteritemSpacing = cellMargin * 0.5
        minimumLineSpacing = cellMargin
        scrollDirection = UICollectionViewScrollDirection.horizontal
        
    }
    
}
