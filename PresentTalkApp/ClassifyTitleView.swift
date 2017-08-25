//
//  ClassifyTitleView.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/10.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

// 代理的方法 定义协议
protocol ClassifyTitleViewDelegate: NSObjectProtocol {

    func selectedOptionAtIndex(_ index: NSInteger)
}

class ClassifyTitleView: UIView {

    weak var delegate: ClassifyTitleViewDelegate?
    fileprivate var singleBtn: UIButton?
    fileprivate var strategyBtn: UIButton?
    fileprivate let lineMargin: CGFloat = 10.0
    
    // 重写父类的方法 初始化方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 重写父类的方法 layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpUIFrame()
    }
    
    // MARK: --视图
    fileprivate func setupUI() {
        backgroundColor = UIColor.clear
        strategyBtn = createBtn("攻略")
        strategyBtn?.addTarget(self, action: #selector(ClassifyTitleView.strategyBtnAction), for: UIControlEvents.touchUpInside)
        singleBtn = createBtn("单品")
        singleBtn?.addTarget(self, action: #selector(ClassifyTitleView.signleBtnAction), for: UIControlEvents.touchUpInside)
        addSubview(singleBtn!)
        addSubview(strategyBtn!)
        addSubview(line)
        
    
    }
    // 设置各个控件的frame
    fileprivate func setUpUIFrame() {
    
        strategyBtn?.frame = CGRect(x: 0, y: 0,width: frame.size.width * 0.5, height: frame.size.height)
        singleBtn?.frame = CGRect(x: strategyBtn!.frame.maxX, y: 0, width: frame.size.width * 0.5, height: frame.size.height)
        line.frame = CGRect(x: lineMargin * 0.5,y: frame.size.height - 6.0, width: frame.size.width * 0.5 - lineMargin, height: 2.0)
    }
    // 创建btn
    fileprivate func createBtn(_ title: String) -> UIButton {
        let btn = UIButton(type: UIButtonType.custom)
        btn.setTitle(title as String, for: UIControlState())
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(UIColor.white, for: UIControlState())
        return btn
    }
    
    // MARK: --事件
    @objc fileprivate func strategyBtnAction() {
        delegate?.selectedOptionAtIndex(0)
    }
    @objc fileprivate func signleBtnAction() {
        delegate?.selectedOptionAtIndex(1)
    }
    
    // MARK: -- 懒加载
    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view

    }()
    // MARK: 公共方法
    func scrollLine(_ scrollViewWidth: CGFloat, offsetX: CGFloat){
        line.frame.origin.x = lineMargin * 0.5 + offsetX / scrollViewWidth * (bounds.width - line.bounds.width - lineMargin)
    }
  

}
