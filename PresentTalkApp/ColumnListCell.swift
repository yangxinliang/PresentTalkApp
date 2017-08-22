//
//  ColumnListCell.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/22.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class ColumnListCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

    
        photoImageView.clipsToBounds = true
        photoImageView.contentMode = UIViewContentMode.scaleAspectFill
        photoImageView.image = UIImage(named:"strategy_\(Int(arc4random() % 17) + 1).jpg")
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
