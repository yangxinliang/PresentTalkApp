//
//  ColumnListHeader.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/22.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class ColumnListHeader: UIView {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        photoImageView.clipsToBounds = true
        photoImageView.contentMode = UIViewContentMode.scaleAspectFill
        photoImageView.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
        
        
    }
    
    class func columnListHeader() -> ColumnListHeader{
        return Bundle.main.loadNibNamed("ColumnListHeader", owner: nil, options: nil)!.last as! ColumnListHeader
    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
