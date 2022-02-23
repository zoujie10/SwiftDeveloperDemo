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
let muneColor = UIColor(r: 255, g: 255, b: 255)

class SwiftSlideAnimationMuneView: UIView {
    let helperSideView = UIView()
    let helperCenterView = UIView()
    var diff : CGFloat = 0.0
    var swiched = false
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
        helperSideView.isHidden = true
        helperCenterView.isHidden = true
        WW_keyWindow?.addSubview(helperSideView)
        WW_keyWindow?.addSubview(helperCenterView)
        WW_keyWindow?.insertSubview(self, belowSubview: helperSideView)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(dismissView))
        self.blurView.addGestureRecognizer(tap)
        self.addBtnTitles(titles:stringTitles)
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
        v.alpha = 0.3
//        self.frame =CGRectMake(-(CGRectGetWidth(keyWindow.frame)/2 + menuBlankWidth), 0, CGRectGetWidth(keyWindow.frame)/2 + menuBlankWidth, CGRectGetHeight(keyWindow.frame));
        
        self.backgroundColor = .clear;
        return v
    }()

    lazy var displayLink : CADisplayLink = {
        let link = CADisplayLink(target: self, selector:#selector(displayLinkAction))
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
            let btn : SwiftSlideAnimationButton = SwiftSlideAnimationButton.init(title: titles[num])
            num += 1
            btn.center = CGPoint(x: Int((WW_keyWindow?.bounds.size.width)!)/4, y: space+menuBtnHeight*i+buttonSpace*i)
            
            btn.bounds = CGRect(x: 0, y: 0, width: Int(CGFloat(WW_keyWindow!.bounds.size.width)/2) - 20*2, height: menuBtnHeight)
            
            self.addSubview(btn)
        }
    }
    
    func getDiff(){
        self.displayLink.add(to: RunLoop.main, forMode: .defaultRunLoopMode)
    }
    //MARK: - Actions
    //移除定时器
    func removeDisplayLink(){
        self.displayLink.invalidate()
    }
    func switchAction(){
        if(!swiched){
            //1.添加模糊背景
            WW_keyWindow?.insertSubview(self.blurView, belowSubview: self)
            //2.滑入菜单栏
            UIView.animate(withDuration: 0.3) { [self] in
                self.frame = self.bounds
                blurView.alpha = 1
            }
            //3.添加弹簧动画
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .beginFromCurrentState) {
                
                self.helperSideView.center = CGPoint(x: (WW_keyWindow?.center.x)!, y: self.helperSideView.bounds.size.height/2)
            } completion: {_ in
                
            }
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .beginFromCurrentState) {
                self.helperCenterView.center = WW_keyWindow!.center
            } completion: {_ in
                self.removeDisplayLink()
            }
            
            //获取差值
            getDiff()
            //添加按钮的动画
            addBtnAnim()
            swiched = true
        }else{
            dismissView()
        }
    }

    @objc func dismissView(){
        swiched = false
        UIView.animate(withDuration: 0.3) {
            self.frame = CGRect(x: -(WW_keyWindow?.frame.size.width)!/2, y: 0, width: (WW_keyWindow?.frame.size.width)!/2 + CGFloat(menuBlankWidth), height: (WW_keyWindow?.frame.size.height)!)
            self.blurView.alpha = 0
            self.helperSideView.center = CGPoint(x: -20, y: 20)
            self.helperCenterView.center = CGPoint(x:-20,y:(WW_keyWindow?.frame.size.height)!/2)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
