//
//  PopoverCategoryView.swift
//  PresentTalkApp
//
//  Created by PingAnXL on 2017/8/4.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

import UIKit

// 点击btn 的代理方法
protocol PopoverCategoryViewDelegate:NSObjectProtocol {

    func selecyedCategoryENDWithIndex(_ index: NSInteger)
    
}

class PopoverCategoryView: UIView {


     weak var delegate: PopoverCategoryViewDelegate?
    // 分类的标题
    var categoryTitles:[String]? {
    
        didSet {
            // 滚动的分类视图
            createScrollCategory(categoryTitles!)
            // 弹出的分类视图
           popoverView = createPopoverView(categoryTitles!)
        
        }
    
    }
    
    // 弹出分类视图按钮列数
    let popverBtnColum = 4
    // 缓存滚动分类按钮
    var cacheScrollCategoryBtns = [UIButton]()
    // 缓存格子分类按钮
    var cacheSquareCategoryBts = [UIButton]()
    // 当前所选滚动分类按钮
    var selectedScrollCategoryBtn : UIButton?
    // 当前所选格子分类按钮
    var selectedSquareCategoryBtn: UIButton?
    // 弹出格子分类的视图
    var popoverView : UIView?
    // 是否显示格子分类视图
    var showingPopoverView = false;
    

    class func popoverCategoryView () -> PopoverCategoryView {

        let view = Bundle.main.loadNibNamed("popoverCategoryView", owner: nil, options: nil)?.last as!PopoverCategoryView
    
        return view;
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    
    }
 
    override init(frame: CGRect) {
      
        super.init(frame: frame)
        
        setUp()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpFrame()
        
    }
    
    // MARK: - 视图
    fileprivate func setUp() {
        backgroundColor = UIColor.white;
        
        // 添加滑动视图
        self.addSubview(scrollView)
        // 添加滚动的红线
        scrollView.addSubview(scrollBottomLineView)
        
        let hidMaskCoverViewPan = UITapGestureRecognizer(target:self,action:#selector(PopoverCategoryView.hidePopoverView))
        
        maskCoverView.addGestureRecognizer(hidMaskCoverViewPan)
    
    
    
    }
    
    fileprivate func setUpFrame() {
    
        if let lastCategoryBtn = cacheScrollCategoryBtns.last {
            
            scrollView.contentSize = CGSize(width:lastCategoryBtn.frame.maxX, height: 0)
            
        }
        // 设置底部线条的frame
        if let cateGoryBtn = selectedScrollCategoryBtn {
            scrollBottomLineView.center = CGPoint(x:cateGoryBtn.center.x, y: bounds.height - 2.0)
            scrollBottomLineView.bounds = CGRect(origin:CGPoint.zero, size: CGSize(width:cateGoryBtn.bounds.width - 10.0, height: 2.0))
        }
    }
    // 创建button
    fileprivate func createBtn(_ title:String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: UIControlState())
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        btn.setTitleColor(UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0), for: UIControlState())
        btn.setTitleColor(UIColor(red: 251.0/255.0, green: 45.0/255.0, blue: 71.0/255.0, alpha: 1.0), for: UIControlState.selected)
        return btn;
        
    }
    // 创建线条
    fileprivate func createVerticalLine(_ frame: CGRect) ->UIView {
        let view  = UIView(frame:frame)
        view.backgroundColor = Color_GlobalLine
        return view;
    }
    // 创建竖直方向的线条
    fileprivate func creatHorizoncalLine(_ frame:CGRect) -> UIView {
        let view = UIView(frame:frame)
        view.backgroundColor = Color_GlobalLine
        return view;
    }

    fileprivate func createScrollCategory(_ title:[String]) {
    
        for i in 0..<title.count {
            let title = title[i]
            let btn = createBtn(title)
            btn.tag = i;
            let width: CGFloat = title.boundingRect(with: CGSize.zero, options: NSStringDrawingOptions(rawValue: 0), attributes: [NSFontAttributeName : btn.titleLabel!.font], context: nil).width + 20
            
            let x: CGFloat = cacheScrollCategoryBtns.last == nil ? 5.0 : cacheScrollCategoryBtns.last!.frame.maxX
        
            btn.frame = CGRect(x : x, y: 0, width: width, height : 44.0)
            print(btn.frame)
            btn.addTarget(self, action: #selector(PopoverCategoryView.scrollCategoryBtnAction(_:)), for: UIControlEvents.touchUpInside)
            scrollView.addSubview(btn)
            cacheScrollCategoryBtns.append(btn)
            if i == 0 {
                scrollCategoryBtnAction(btn)
            }
            
        }
 
    }
    
    // 创建popoverView
    fileprivate func createPopoverView(_ titles:[String]) -> UIView {
    
        let btnWidth = ScreenWidth / CGFloat(popverBtnColum)
        let btnHeight: CGFloat = 50.0
        let popoverView = UIView()
        
        for i in 0..<titles.count {
            
            let column = i % popverBtnColum
            let row = i / popverBtnColum
            let x = btnWidth * CGFloat(column)
            let y = btnHeight * CGFloat(row)
            let btn = createBtn(titles[i])
            btn.tag = i
            btn.frame = CGRect(x: x, y: y, width: btnWidth, height: btnHeight)
            btn.addTarget(self, action: #selector(PopoverCategoryView.squareCategoryBtnAction(_:)), for: UIControlEvents.touchUpInside)
            popoverView.addSubview(btn)
            cacheSquareCategoryBts.append(btn)
            // 线条
            btn.addSubview(createVerticalLine(CGRect(x: btn.bounds.width - 0.5, y: 0, width: 0.5, height: btn.bounds.height)))
            btn.addSubview(creatHorizoncalLine(CGRect(x: 0 , y : btn.bounds.height - 0.5, width: btn.bounds.width,height: 0.5)))
            if i == 0 {
                squareCategoryBtnAction(btn)
            }
      
        }
       
        popoverView.addSubview(squareBottomLineView)
        popoverView.backgroundColor = UIColor.white
        popoverView.frame = CGRect(x: 0, y: -cacheSquareCategoryBts.last!.frame.maxY,width: ScreenWidth,height: -cacheSquareCategoryBts.last!.frame.maxY)
        
        return popoverView
    
    }

    //MARK: 公共方法
    
    func scrollCategoryBtnByIndex(_ index: NSInteger)  {
        
        scrollCategoryBtnAction(cacheSquareCategoryBts[index])
        
    }
    
    
    // 创建头视图按钮
    @objc fileprivate func scrollCategoryBtnAction(_ sender: UIButton) {
    
        if let btn = selectedScrollCategoryBtn {
            btn.isSelected = false
        }
        sender.isSelected = !sender.isSelected
        selectedScrollCategoryBtn = sender
        
        if sender.center.x < bounds.width * 0.5 {
            scrollView.setContentOffset(CGPoint.zero, animated: true)
        }else if scrollView.contentSize.width > bounds.width && sender.center.x > bounds.width * 0.5 && sender.center.x < (scrollView.contentSize.width - bounds.width * 0.5) {
            scrollView.setContentOffset(CGPoint(x: sender.frame.origin.x + sender.bounds.width * 0.5 - bounds.width * 0.5, y: 0), animated: true)
        
        }else {
            scrollView.setContentOffset(CGPoint(x: max(scrollView.contentSize.width - scrollView.bounds.size.width,0), y: 0), animated: true)
        }
        setNeedsLayout()
        delegate?.selecyedCategoryENDWithIndex(sender.tag)
    
    }
    
    // 创建 方形 btn 
    @objc fileprivate func squareCategoryBtnAction(_ sender: UIButton) {
        if let btn = selectedSquareCategoryBtn {
           btn.isSelected = false
        }
        sender.isSelected = !sender.isSelected
        selectedSquareCategoryBtn = sender
        squareBottomLineView.frame = CGRect(x: sender.frame.origin.x, y: sender.frame.maxY,width: sender.frame.width, height: 2.0)
        if showingPopoverView {
             hidePopoverView()
        }
     
    
    }
    
    /*
    x显示筛选的视图
    */
    
    fileprivate func showPopoverView() {
    
    backgroundColor =  switchCover.backgroundColor
        switchBtn.isSelected = true
        switchCover.isHidden = false
        /// 选择格子分类的按钮
        squareCategoryBtnAction(cacheSquareCategoryBts[selectedSquareCategoryBtn!.tag])
        // 显示蒙版
        showMaskCoverView()
        /// 显示筛选视图
        superview!.insertSubview(popoverView!, belowSubview: self)
        switchCover.alpha = 0
        showingPopoverView = true
        UIView.animate(withDuration: 0.3) { 
            self.switchCover.alpha = 1.0;
            self.popoverView!.frame.origin.y = self.bounds.height
            
        }
        
    
    }
    
    @objc fileprivate func hidePopoverView() {
    
        guard let _ = popoverView else {
            
            return;
        }
        backgroundColor = UIColor.white
        switchBtn.isSelected = false
        switchBtn.isHidden = true
        // 选择格子分类按钮
        scrollCategoryBtnAction(cacheScrollCategoryBtns[selectedScrollCategoryBtn!.tag])
        UIView.animate(withDuration: 0.3, animations: { 
                        self.popoverView!.frame.origin.y = -self.popoverView!.bounds.height
                        self.switchCover.alpha = 0.0
        }) { (true) in
            self.popoverView!.removeFromSuperview()
            self.showingPopoverView = false

        }
        /// 隐藏蒙版
        
        hideMaskCoverView()
      
    }
  
    /*
     显示蒙版
     
     */
    fileprivate func showMaskCoverView() {
    
    superview!.insertSubview(maskCoverView, belowSubview: self)
    }
    /*
     隐藏蒙版
     */
    
    @objc fileprivate func hideMaskCoverView() {
    
       maskCoverView.removeFromSuperview()
    
    
    }
    // MARK: -懒加载
    
    fileprivate var squareBottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 251.0/255.0, green: 45.0/255.0, blue: 71.0/255.0, alpha: 1.0)
        return view
    }()
    
    fileprivate var scrollBottomLineView: UIView = {
      let view = UIView()
        view.backgroundColor = UIColor(red: 251.0/255.0, green: 45.0/255.0, blue: 71.0/255.0, alpha: 1.0)
        return view;
    }()
 
    fileprivate lazy var maskCoverView: MaskCoverView = MaskCoverView()

    
    fileprivate lazy var createHline: UIView = {
      
        let view = UIView()
        view.backgroundColor = Color_GlobalLine
        return view
   
    }()
    
    
    fileprivate lazy var scrollView: UIScrollView = {
       let coustom = UIScrollView()
        coustom.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: self.frame.height)
       return coustom
    }()
    
    fileprivate lazy var switchBtn: UIButton = {
       let coustom = UIButton()
        return coustom
    }()
    fileprivate lazy var switchCover: UIView = {
        let coustom = UIView()
        return coustom
    }()

    
}
