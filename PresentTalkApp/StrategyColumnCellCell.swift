//
//  StrategyColumnCellCell.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/16.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class StrategyColumnCellCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var viewAllcoverView: UIView!
    
    @IBOutlet weak var viewAllBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photoImageView.clipsToBounds = true
        photoImageView.contentMode =  UIViewContentMode.scaleAspectFill;
        photoImageView.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
        
        viewAllBtn.layer.masksToBounds = true
        viewAllBtn.layer.cornerRadius = 2.0
        viewAllBtn.layer.borderColor = viewAllBtn.titleLabel!.textColor.cgColor
        viewAllBtn.layer.borderWidth = 0.5

        
    }
    @IBAction func viewAllBtnAction(_ sender: Any) {
    }
   

}
