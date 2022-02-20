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
//    UIView *helperSideView;
//    UIView *helperCenterView;
//    CGFloat diff;
//
//    CADisplayLink *displayLink;
    
    let helperSideView = UIView()
    let helperCenterView = UIView()
    var diff : CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(stringTitles: [String]) {
        self.init()
        
        self.frame = CGRect(x: -CGFloat(WW_keyWindow!.frame.size.width/2) + CGFloat(menuBlankWidth), y: 0, width: (WW_keyWindow?.frame.size.width)!/2 + CGFloat(menuBlankWidth), height: (WW_keyWindow?.frame.size.height)!)
        self.backgroundColor = .clear;
        WW_keyWindow?.addSubview(self)

        helperSideView.frame = CGRect(x: -40, y: 0, width: 40, height: 40)
        helperSideView.backgroundColor = .red
        helperCenterView.frame = CGRect(x: -40, y:(WW_keyWindow?.bounds.size.height)!/2 - 20 , width: 40, height: 40)
        helperCenterView.backgroundColor = .orange
        
        WW_keyWindow?.addSubview(helperSideView)
        WW_keyWindow?.addSubview(helperCenterView)
        
        self.addBtnTitles(titles:stringTitles)
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

    lazy var displayLink : CADisplayLink = {
        let link = CADisplayLink(target: self, selector:#selector(displayLinkAction))
        displayLink.add(to: RunLoop.main, forMode: .defaultRunLoopMode)
        return link
    }()
    
    @objc func displayLinkAction(){
        //    NSLog(@"%@",NSStringFromCGRect(helperSideView.frame));
        print(NSStringFromCGRect(helperSideView.frame))
        let layer1 = helperSideView.layer.presentation()
        let layer2 = helperCenterView.layer.presentation()
        
        let r1 : CGRect = layer1?.value(forKeyPath: "frame") as! CGRect
        let r2 : CGRect = layer2?.value(forKeyPath: "frame") as! CGRect
        
        diff = r1.origin.x - r2.origin.x
        self.setNeedsDisplay()
    }
    
    func addBtnAnim(){
        for i in 0 ..< self.subviews.count {
            let btn = self.subviews[i]
            btn.transform = CGAffineTransform.init(translationX: -100, y: 0)
            UIView.animate(withDuration: 0.7, delay: Double(i)*(0.3/Double(self.subviews.count)), usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .beginFromCurrentState) {
                btn.transform = CGAffineTransform.identity
            } completion: { _ in
                
            }
        }
    }
    
    func addBtnTitles(titles : [String]){
        
        let space = (Int(WWScreenHeight)-titles.count*menuBtnHeight-(titles.count-1)*buttonSpace)/2
      
        var num : Int = 0
        for i in 0..<titles.count{
            let btn : SwiftSlideAnimationButton = SwiftSlideAnimationButton.init(title: titles[num] as! String)
            num += 1
            btn.center = CGPoint(x: Int((WW_keyWindow?.bounds.size.width)!)/4, y: space+menuBtnHeight*i+buttonSpace*i)
            
            btn.bounds = CGRect(x: 0, y: 0, width: Int(CGFloat(WW_keyWindow?.bounds.size.width ?? 0/2)) - 20*2, height: menuBtnHeight)
            
            self.addSubview(btn)
        }
    }
    

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
