//
//  SwiftSlideAnimationMuneView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/14.
//  Copyright © 2022 Zoujie. All rights reserved.
//
/*
 1.添加模糊背景
 2.划入菜单栏
 3.思考：如何让view动起来？多次绘制（动画基于绘制）
 4.通过2个辅助view，求出它们的插值，获取到一组动态的数据
 5.CADisplayLink
 6.添加按钮
 */
import UIKit
let menuBlankWidth = 50
let menuBtnHeight = 40
let buttonSpace = 30
class SwiftSlideAnimationMuneView: UIView {
    let muneColor = UIColor(r: 0, g: 0.722, b: 1)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(_: [String]) {
        self.init()
        
        self.frame = CGRect(x: -CGFloat(WW_keyWindow!.frame.size.width/2) + CGFloat(menuBlankWidth), y: 0, width: (WW_keyWindow?.frame.size.width)!/2 + CGFloat(menuBlankWidth), height: (WW_keyWindow?.frame.size.height)!)
        self.backgroundColor = .clear;
        WW_keyWindow?.addSubview(self)
    }
    
    func switchAction(){
        
        
    }
    
    override func draw(_ rect: CGRect) {
//        UIBezierPath *path = [UIBezierPath bezierPath];
//        [path moveToPoint:CGPointMake(0, 0)];
//        [path addLineToPoint:CGPointMake(CGRectGetWidth(keyWindow.frame)/2, 0)];
//        [path addQuadCurveToPoint:CGPointMake(CGRectGetWidth(keyWindow.frame)/2, CGRectGetHeight(keyWindow.frame)) controlPoint:CGPointMake(CGRectGetWidth(keyWindow.frame)/2 + diff, CGRectGetHeight(keyWindow.frame)/2)];
//        [path addLineToPoint:CGPointMake(0, CGRectGetHeight(keyWindow.frame))];
//        [path closePath];
//        
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        CGContextAddPath(context, path.CGPath);
//        [menuColor set];
//        CGContextFillPath(context);
    }
    
    lazy var blurView : UIVisualEffectView = {
        
        let v = UIVisualEffectView(effect: UIBlurEffect.init(style: .dark))
        v.frame = WW_keyWindow!.frame
        v.alpha = 0.5
        
//        self.frame =CGRectMake(-(CGRectGetWidth(keyWindow.frame)/2 + menuBlankWidth), 0, CGRectGetWidth(keyWindow.frame)/2 + menuBlankWidth, CGRectGetHeight(keyWindow.frame));
        
        self.backgroundColor = .clear;
        return v
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
