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
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (WW_keyWindow?.frame.size.width)!/2, y: 0))
        path.addQuadCurve(to: CGPoint(x: (WW_keyWindow?.frame.size.width)!/2, y: (WW_keyWindow?.frame.size.height)!), controlPoint: CGPoint(x: (WW_keyWindow?.frame.size.width)!/2, y: (WW_keyWindow?.frame.size.height)!/2))
        path.addLine(to: CGPoint(x: 0, y: (WW_keyWindow?.frame.size.height)!))
        path.close()
        
        let context = UIGraphicsGetCurrentContext()!
        context.addPath(path.cgPath)
        muneColor.set()
        context.fillPath()
    }
    
    lazy var blurView : UIVisualEffectView = {
        
        let v = UIVisualEffectView(effect: UIBlurEffect.init(style: .dark))
        v.frame = WW_keyWindow!.frame
        v.alpha = 0.5
        
//        self.frame =CGRectMake(-(CGRectGetWidth(keyWindow.frame)/2 + menuBlankWidth), 0, CGRectGetWidth(keyWindow.frame)/2 + menuBlankWidth, CGRectGetHeight(keyWindow.frame));
        
        self.backgroundColor = .clear;
        return v
    }()
    
    func addBtnAnim(){
        
    }
    
    func addBtnTitles(titles : NSArray){
        
    }
    
//    #pragma mark - func
//    - (void)addBtnAnim{
//        for (int i = 0; i < self.subviews.count; i++) {
//            UIView *btn = self.subviews[i];
//            btn.transform = CGAffineTransformMakeTranslation(-100, 0);
//            [UIView animateWithDuration:.7 delay:i*(0.3/self.subviews.count) usingSpringWithDamping:.6 initialSpringVelocity:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//                btn.transform = CGAffineTransformIdentity;
//            } completion:nil];
//        }
//    }
//    - (void)addBtnTitles:(NSArray *)titles{
//        CGFloat space = (CGRectGetHeight(keyWindow.bounds) - titles.count*menuBtnHeight - (titles.count-1)*buttonSpace)/2;
//        for (int i = 0; i < titles.count; i++) {
//            slideMenuBtn *btn = [[slideMenuBtn alloc] initWithTitle:titles[i]];
//            btn.center = CGPointMake(CGRectGetWidth(keyWindow.bounds)/4, space + menuBtnHeight*i + buttonSpace*i);
//            btn.bounds = CGRectMake(0, 0, CGRectGetWidth(keyWindow.bounds)/2 - 20*2, menuBtnHeight);
//            [self addSubview:btn];
//        }
//    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
