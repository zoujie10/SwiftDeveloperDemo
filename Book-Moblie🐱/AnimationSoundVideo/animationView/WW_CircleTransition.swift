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
        return 0.8
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
        
        /*
         拆分：
         1.2个圆（重点：半径，中心点）
         2.添加动画
         */
//        //1.持有上下文
//        _context = transitionContext;
//        //2.获取一个view的容器
//        UIView *containerView = [transitionContext containerView];
//        //3.获取tovc的view，然后添加到容器里面
//        UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    //    [containerView addSubview:toVC.view];
//        //4.添加动画
//        UIButton *btn;
//        ViewController *VC1;
//        DNBlackViewController *VC2;
//        if (_isPush) {
//            VC1 = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//            VC2 = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//            btn = VC1.blackBtn;
//
//        }else{
//            VC2 = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//            VC1 = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//            btn = VC2.redBtn;
//        }
//        [containerView addSubview:VC1.view];
//        [containerView addSubview:VC2.view];
//    //    ViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    //    UIButton *btn = fromVC.blackBtn;
//        //5.画一个小圆(大小圆的中心点是一样)
//        UIBezierPath *smallPath = [UIBezierPath bezierPathWithOvalInRect:btn.frame];
//        //6.中心点
//        CGPoint centerP;
//        centerP = btn.center;
//        //7.求大圆的半径
//        CGFloat radius;
//        //8.判断按钮在哪个象限
//        CGFloat y = CGRectGetHeight(toVC.view.frame) - btn.center.y;
//        CGFloat x = CGRectGetWidth(toVC.view.frame) - btn.center.x;
//        if (btn.frame.origin.x > CGRectGetWidth(toVC.view.frame)/2) {
//            if (btn.frame.origin.y < CGRectGetHeight(toVC.view.frame)/2) {
//                //1
//                radius = sqrtf(btn.center.x*btn.center.x + y*y);
//            }else{
//                //4
//                radius = sqrtf(btn.center.x*btn.center.x + btn.center.y*btn.center.y);
//            }
//        }else{
//            if (CGRectGetMaxY(btn.frame) < CGRectGetHeight(toVC.view.frame)/2) {
//                //2
//                radius = sqrtf(x*x + y*y);
//            }else{
//                //3
//                radius = sqrtf(btn.center.y*btn.center.y + x*x);
//            }
//        }
//        //9.用贝塞尔画大圆
//        UIBezierPath *bigPath = [UIBezierPath bezierPathWithArcCenter:centerP radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
//        //10.把path添加到layer
//        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//        if (_isPush) {
//            shapeLayer.path = bigPath.CGPath;
//
//        }else{
//            shapeLayer.path = smallPath.CGPath;
//
//        }
//    //    [toVC.view.layer addSublayer:shapeLayer];
//        //11.蒙板
//        UIViewController *VC;
//        if (_isPush) {
//            VC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//        }else{
//            VC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//
//        }
//        VC.view.layer.mask = shapeLayer;
//        //12.动画
//        CABasicAnimation *anim = [CABasicAnimation animation];
//        anim.keyPath = @"path";
//        if (_isPush) {
//            anim.fromValue = (id)smallPath.CGPath;
//
//        }else{
//            anim.fromValue = (id)bigPath.CGPath;
//
//        }
//    //    anim.toValue = bigPath;
//        anim.delegate = self;
//        [shapeLayer addAnimation:anim forKey:nil];
//
        
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
