//
//  WW_CircleTransition.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/28.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
//SwiftCAAnimationViewControllerTwo
//SwiftCAAnimationViewControllerThree
class WW_CircleTransition: NSObject,UIViewControllerAnimatedTransitioning,CAAnimationDelegate {
    var isPush : Bool = false
    var context : AnyObject?
    
    
    //MARK:UIViewControllerAnimatedTransitioning 转场动画的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.5
    }
    //在此方法中实现具体的转场动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        /*
         拆分：
         1.2个圆（重点：半径，中心点）
         2.添加动画
         */
        //1.持有上下文
        self.context = transitionContext
        
        //2.获取一个view的容器
        let containerView = transitionContext.containerView

        //3.获取tovc的view，然后添加到容器里面
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        containerView.addSubview(toVC!.view)
//        //4.添加动画
        var btn : UIButton!
        var VC1 = SwiftCAAnimationViewControllerTwo()
        var VC2 = SwiftCAAnimationViewControllerThree()
        if isPush{
            VC1 = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! as! SwiftCAAnimationViewControllerTwo
            VC2 = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as! SwiftCAAnimationViewControllerThree
            btn = VC1.transitionLayerBtn
        }else{
            VC2 = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)! as! SwiftCAAnimationViewControllerThree
            VC1 = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as! SwiftCAAnimationViewControllerTwo
            btn = VC2.transitionLayerBtn
        }
        containerView.addSubview(VC1.view)
        containerView.addSubview(VC2.view)

    //    ViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //    UIButton *btn = fromVC.blackBtn;
        //5.画一个小圆(大小圆的中心点是一样)
        let smallPath = UIBezierPath.init(ovalIn: btn.frame)
        //6.中心点
        var centerP = CGPoint.init()
        centerP = btn.center
        //7.求大圆的半径
        var radius = Float.init()
        //8.判断按钮在哪个象限
        let y = (toVC?.view.frame.size.height)! - btn.center.y
        let x = (toVC?.view.frame.size.width)! - btn.center.x
        if btn.frame.origin.x > ((toVC?.view.frame.size.width)!/2){
            if  btn.frame.origin.y < ((toVC?.view.frame.size.height)!/2){
                //1
                radius = sqrtf(Float(btn.center.x * btn.center.x) + Float(y*y))
            }else{
                //4
                radius = sqrtf(Float(btn.center.x*btn.center.x)+Float(btn.center.y*btn.center.y))
            }
        }else{
            if(btn.frame.maxY < ((toVC?.view.frame.size.height)!/2)){
                //2
                radius = sqrtf(Float(x*x) + Float(y*y))
            }else{
                //3
                radius = sqrtf(Float(btn.center.y*btn.center.y)+Float(x*x))
            }
        }

        //9.用贝塞尔画大圆
        let bigPath = UIBezierPath.init(arcCenter: centerP, radius: CGFloat(radius), startAngle: 0, endAngle: Double.pi*2, clockwise: true)
        //10.把path添加到layer
    //    [toVC.view.layer addSublayer:shapeLayer];
        let shapeLayer = CAShapeLayer.init()
        if isPush{
            shapeLayer.path = bigPath.cgPath
        }else{
            shapeLayer.path = smallPath.cgPath
        }
//        //11.蒙板
        var VC = UIViewController()
        if isPush{
            VC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        }else{
            VC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        }
        VC.view.layer.mask = shapeLayer
//        //12.动画
        let anim : CABasicAnimation = CABasicAnimation.init()
        anim.keyPath = "path"
        if isPush{
            anim.fromValue = smallPath.cgPath
        }else{
            anim.fromValue = bigPath.cgPath
        }
        anim.delegate = self
        shapeLayer.add(anim, forKey: nil)
    }
    
    //MARK:CAAnimationDelegate
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        context?.completeTransition(true)
        var vc = UIViewController();
        if(isPush){
            vc = (context?.viewController(forKey: UITransitionContextViewControllerKey.to))!
        }else{
            vc = (context?.viewController(forKey: UITransitionContextViewControllerKey.from))!
        }
        vc.view.layer.mask = nil
    }
}
