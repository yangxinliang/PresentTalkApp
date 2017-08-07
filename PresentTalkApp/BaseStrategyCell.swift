//
//  BaseStrategyCell.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/5.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

class BaseStrategyCell: UITableViewCell {

    @IBOutlet weak var tagBtn: UIButton!
    
    @IBOutlet weak var tagTitleBtn: UIButton!
    
    @IBOutlet weak var headBtn: UIButton!
    
    @IBOutlet weak var coverImageview: UIImageView!
    
    @IBOutlet weak var textLab: UILabel!
    @IBOutlet weak var priseBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

       setUpUI()
    
    }

    // mark： - 视图
    fileprivate func setUpUI() {
    
        selectionStyle = UITableViewCellSelectionStyle.none
        layer.borderWidth = 3;
        layer.borderColor = Color_GlobalBackground.cgColor
        
        tagBtn.layer.cornerRadius = 5.0
        tagBtn.layer.masksToBounds = true
        
        headBtn.layer.cornerRadius = headBtn.bounds.width * 0.5
        headBtn.layer.masksToBounds = true
        
        coverImageview.clipsToBounds = true
        coverImageview.contentMode = UIViewContentMode.scaleAspectFill
        coverImageview.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
    
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tagBtnAction(_ sender: Any) {
    }
    
    
    @IBAction func tagTitleBtn(_ sender: Any) {
    }
    
    @IBAction func headBtn(_ sender: Any) {
    }
}
