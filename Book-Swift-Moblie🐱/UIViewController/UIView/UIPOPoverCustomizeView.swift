//
//  UIPOPoverCustomizeView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/25.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

let kPopoverViewMargin = 8 //边距
let kPopoverViewCellHeight = 40 //cell高度
let kPopoverViewArrowHeight = 10 //箭头高度


class UIPOPoverCustomizeView: UIView {
    /**
     是否开启点击外部隐藏弹窗, 默认为YES.
     */
    var hideAfterTouchOutside = false
    /**
     是否显示阴影, 如果为YES则弹窗背景为半透明的阴影层, 否则为透明, 默认为NO.
     */
    var showShade = true

    var arrayData = NSArray.init()
    
    let tapGesture = UITapGestureRecognizer.init()
    
    var windowWidth : CGFloat = 0.0
    var windowHeight : CGFloat = 0.0
    var isUpward = true //< 箭头指向, true为向上, 反之为向下, 默认为true.
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize(){
        self.backgroundColor = .white
        windowWidth = WW_keyWindow!.bounds.size.width
        windowHeight = WW_keyWindow!.bounds.size.height

        shadeView.frame = WW_keyWindow!.bounds
        self.tapGesture.addTarget(self, action:  #selector(tapTapTap))
        shadeView.addGestureRecognizer(self.tapGesture)
        shadeView.isUserInteractionEnabled = true
        self.addSubview(tableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = CGRect(x: 0, y: isUpward ? CGFloat(kPopoverViewArrowHeight) : 0, width: self.bounds.size.width, height: self.bounds.size.height - CGFloat(kPopoverViewArrowHeight))
    }
    
    func showToPoint(toPoint:CGPoint){
        // 截取弹窗时相关数据
        let arrowWidth : CGFloat = 18, cornerRadius : CGFloat = 6
        
        // 如果箭头指向的点过于偏左或者过于偏右则需要重新调整箭头 x 轴的坐标
//        let minHorizontalEdge = CGFloat(kPopoverViewMargin) + cornerRadius + arrowWidth/2 + 2
//        if toPoint.x < minHorizontalEdge {
//            toPoint.x = minHorizontalEdge
//        }
//        if windowWidth - toPoint.x < minHorizontalEdge {
//            toPoint.x = windowWidth - minHorizontalEdge
//        }
        // 遮罩层
        shadeView.alpha = 0
        WW_keyWindow!.addSubview(shadeView)
        // 刷新数据以获取具体的ContentSize
        tableView.reloadData()
        // 根据刷新后的ContentSize和箭头指向方向来设置当前视图的frame
//        let currentW = calculateMaxWidth()// 宽度通过计算获取最大值
        let currentW : CGFloat = 100
        var currentH = tableView.contentSize.height
        
        // 箭头高度
        currentH += CGFloat(kPopoverViewArrowHeight)
        // 限制最高高度, 免得选项太多时超出屏幕 //TODO
        
        var currentX = toPoint.x - currentW/2, currentY = toPoint.y
        // x: 窗口靠左
        if (toPoint.x <= currentW/2 + CGFloat(kPopoverViewMargin)) {
            currentX = CGFloat(kPopoverViewMargin);
        }
        // x: 窗口靠右
        if (windowWidth - toPoint.x <= currentW/2 + CGFloat(kPopoverViewMargin)) {
            currentX = windowWidth - CGFloat(kPopoverViewMargin) - currentW;
        }
        // y: 箭头向下
        if (!isUpward) {
            currentY = toPoint.y - currentH;
        }
        self.frame = CGRect(x: currentX, y: currentY, width: currentW, height: currentH)
        // 截取箭头
        let arrowPoint = CGPoint(x: toPoint.x - self.frame.minX , y: isUpward ? 0:currentH)// 箭头顶点在当前视图的坐标
        let maskTop = isUpward ? kPopoverViewArrowHeight : 0// 顶部Y值
        let maskBottom = isUpward ? currentH : currentH - CGFloat(kPopoverViewArrowHeight) // 底部Y值
        let maskPath = UIBezierPath.init()
        
        // 左上圆角
        maskPath.move(to: CGPoint(x: 0.00, y: cornerRadius + CGFloat(maskTop)))
        maskPath.addArc(withCenter: CGPoint(x: cornerRadius, y: cornerRadius + CGFloat(maskTop)),
                        radius: cornerRadius,
                        startAngle: CGFloat(PopoverViewDegreesToRadians(angle: 180)),
                        endAngle: CGFloat(PopoverViewDegreesToRadians(angle: 270)),
                        clockwise: true)
        // 箭头向上时的箭头位置
        if isUpward {
            let linePonit1 = CGPoint(x:(arrowPoint.x-arrowWidth/2),y: CGFloat(kPopoverViewArrowHeight))
            maskPath.addLine(to:linePonit1)
            maskPath.addLine(to:arrowPoint)
            maskPath.addLine(to:CGPoint(x: arrowPoint.x + arrowWidth/2, y: CGFloat(kPopoverViewArrowHeight)))
        }
        // 右上圆角
        maskPath.addLine(to: CGPoint(x: CGFloat(currentW-cornerRadius), y:CGFloat(maskTop)))
        maskPath.addArc(withCenter: CGPoint(x: CGFloat(currentW-cornerRadius), y: cornerRadius + CGFloat(maskTop)),
                        radius: cornerRadius,
                        startAngle: CGFloat(PopoverViewDegreesToRadians(angle: 270)),
                        endAngle: CGFloat(PopoverViewDegreesToRadians(angle: 0)),
                        clockwise: true)
        // 右下圆角
        maskPath.addLine(to: CGPoint(x: currentW, y:maskBottom-cornerRadius))
        maskPath.addArc(withCenter: CGPoint(x: CGFloat(currentW-cornerRadius), y: maskBottom-cornerRadius),
                        radius: cornerRadius,
                        startAngle: CGFloat(PopoverViewDegreesToRadians(angle: 0)),
                        endAngle: CGFloat(PopoverViewDegreesToRadians(angle: 90)),
                        clockwise: true)
        // 箭头向下时的箭头位置
        if !isUpward{
            let linePonit1 = CGPoint(x:(arrowPoint.x+arrowWidth/2),y:currentH - CGFloat(kPopoverViewArrowHeight))
            maskPath.addLine(to:linePonit1)
            maskPath.addLine(to:arrowPoint)
            maskPath.addLine(to:CGPoint(x: arrowPoint.x - arrowWidth/2, y:currentH - CGFloat(kPopoverViewArrowHeight)))
        }
        // 左下圆角
        maskPath.addLine(to: CGPoint(x: cornerRadius, y:maskBottom))
        maskPath.addArc(withCenter: CGPoint(x: cornerRadius, y: maskBottom-cornerRadius),
                        radius: cornerRadius,
                        startAngle: CGFloat(PopoverViewDegreesToRadians(angle: 90)),
                        endAngle: CGFloat(PopoverViewDegreesToRadians(angle: 180)),
                        clockwise: true)
        maskPath.close()
        // 截取圆角和箭头
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        WW_keyWindow?.addSubview(self)
        // 弹出动画
        let oldFrame = self.frame
        self.layer.anchorPoint = CGPoint(x: arrowPoint.x/currentW, y: isUpward ? 0:1)
        self.frame = oldFrame
        self.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.25) {
            self.transform = .identity
            self.shadeView.alpha = 1
        }
    }
    //MARK: PUBLIC
    public func showToView(pointView:UIView,content:NSArray){
        // 判断 pointView 是偏上还是偏下
        let pointViewRect = pointView.superview?.convert(pointView.frame, to: WW_keyWindow)
        let pointViewUpLength = pointViewRect?.maxY
        let pointViewDownLength = windowHeight - pointViewRect!.maxY
        
        // 弹窗箭头指向的点
        var toPoint = CGPoint(x: pointViewRect!.minX, y: 0)
        // 弹窗在 pointView 顶部
        if pointViewUpLength! > pointViewDownLength{
            toPoint.y = pointViewUpLength! - 5
        }else{// 弹窗在 pointView 底部
            toPoint.y = pointViewRect!.maxY + 5
        }
        
//        isUpward = pointViewUpLength! <= pointViewDownLength
        
        self.arrayData = content
        // 箭头指向方向
        showToPoint(toPoint: toPoint)
    }
    public func showToPoint(toPoint:CGPoint,content:NSArray){
       
    }
    /*! @brief 计算最大宽度 */
//    func calculateMaxWidth() -> CGFloat{
//
//    }
    
    
    //MARK: private method
    func PopoverViewDegreesToRadians(angle:Float)-> Float{
        return angle*Float(Double.pi)/180
    }
    @objc func tapTapTap(){
        hide()
    }
    func hide(){
        UIView.animate(withDuration: 0.25) {
            self.alpha = 0
            self.shadeView.alpha = 0
            self.transform = CGAffineTransform.init(translationX: 0.01, y: 0.01)
        } completion: { finish in
            self.shadeView.removeFromSuperview()
            self.removeFromSuperview()
        }

    }
    //MARK: lazy method
    lazy var shadeView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(r: 1, g: 1, b: 1,a: 0.3)
        return v
    }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_LeftTagsTableViewCell.classForCoder(), forCellReuseIdentifier:"cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        tableView.rowHeight = CGFloat(kPopoverViewCellHeight)
        return tableView
    }()

}
extension UIPOPoverCustomizeView : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WW_LeftTagsTableViewCell
        cell.titleLabel.text = (arrayData[indexPath.row] as! String)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hide()
    }
    
}
