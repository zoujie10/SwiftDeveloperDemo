//
//  SwiftAnimationSoundVideoVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/7.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftAnimationSoundVideoVC: UIViewController,CAAnimationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "动画"
        //1.动画
        //1.1 UIView动画
        uiviewAnimationMethod()
       
        //1.2 UIImageView播放帧
//        uiimageviewAnimation()
       
        //1.3 位移关键帧动画
//        KeyframeAnimation()
    }
    
    func uiviewAnimationMethod(){
        let view = UIView()
        view.backgroundColor = .orange
        view.alpha = 1
        
        self.view.addSubview(self.animationView)
        self.animationView.snp.makeConstraints {
            $0.center.equalTo(self.view)
            $0.width.height.equalTo(100)
        }
        self.view.addSubview(self.topAnimationImageView)
        self.topAnimationImageView.snp.makeConstraints {
            $0.left.equalTo(self.view).offset(100)
            $0.top.equalTo(self.view).offset(100)
            $0.width.height.equalTo(50)
        }
        
        self.view.addSubview(self.blueAnimationView)
        self.blueAnimationView.snp.makeConstraints {
            $0.bottom.equalTo(self.animationView.snp_top).offset(-20)
            $0.width.height.equalTo(100)
            $0.centerX.equalTo(self.animationView)
        }
        
        self.view.addSubview(self.animationImageView)
        self.animationImageView.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.centerX.equalTo(self.animationView)
            $0.bottom.equalTo(self.blueAnimationView.snp_top).offset(-20)
        }
        
        let button = UIButton()
        button.setTitle("Animation", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(animationMethod), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalTo(self.animationView.snp_bottom).offset(20)
            $0.centerX.equalTo(self.animationView)
        }
        
        
        let cancelbutton = UIButton()
        cancelbutton.setTitle("Cancel Animation", for: .normal)
        cancelbutton.setTitleColor(.blue, for: .normal)
        cancelbutton.addTarget(self, action: #selector(cancelanimationMethod), for: .touchUpInside)
        
        self.view.addSubview(cancelbutton)
        cancelbutton.snp.makeConstraints {
            $0.top.equalTo(button.snp_bottom).offset(10)
            $0.centerX.equalTo(self.animationView)
        }
        
        let jumpbutton = UIButton()
        jumpbutton.setTitle("Jump Sound Video", for: .normal)
        jumpbutton.setTitleColor(.blue, for: .normal)
        jumpbutton.addTarget(self, action: #selector(jumpMethod), for: .touchUpInside)
        
        self.view.addSubview(jumpbutton)
        jumpbutton.snp.makeConstraints {
            $0.top.equalTo(cancelbutton.snp_bottom).offset(10)
            $0.centerX.equalTo(self.animationView)
        }
        
        let cAAnimation = UIButton()
        cAAnimation.setTitle("CAAnimation核心动画-曲线/抖动", for: .normal)
        cAAnimation.setTitleColor(.blue, for: .normal)
        cAAnimation.addTarget(self, action: #selector(CAAnimationMethod), for: .touchUpInside)
        
        self.view.addSubview(cAAnimation)
        cAAnimation.snp.makeConstraints {
            $0.top.equalTo(jumpbutton.snp_bottom).offset(10)
            $0.centerX.equalTo(self.animationView)
        }
        
        let cAAnimation2 = UIButton()
        cAAnimation2.setTitle("核心动画-弹层/立方体/点赞/自定义转场", for: .normal)
        cAAnimation2.setTitleColor(.blue, for: .normal)
        cAAnimation2.addTarget(self, action: #selector(CAAnimationMethod2), for: .touchUpInside)
        
        self.view.addSubview(cAAnimation2)
        cAAnimation2.snp.makeConstraints {
            $0.top.equalTo(cAAnimation.snp_bottom).offset(10)
            $0.centerX.equalTo(self.animationView)
        }
        
        let cAAnimation3 = UIButton()
        cAAnimation3.setTitle("CAAnimation核心动画--QQ气泡/自由落体", for: .normal)
        cAAnimation3.setTitleColor(.blue, for: .normal)
        cAAnimation3.addTarget(self, action: #selector(CAAnimationMethod3), for: .touchUpInside)
        
        self.view.addSubview(cAAnimation3)
        cAAnimation3.snp.makeConstraints {
            $0.top.equalTo(cAAnimation2.snp_bottom).offset(10)
            $0.centerX.equalTo(self.animationView)
        }
        self.view.addSubview(self.textLabel)
        self.textLabel.snp.makeConstraints {
            $0.top.equalTo(cAAnimation3.snp_bottom).offset(10)
            $0.centerX.equalTo(self.animationView)
        }
    }
    
    lazy var animationView : UIView = {
       let animationView = UIView()
        animationView.backgroundColor = .orange
        animationView.alpha = 1
        return animationView
    }()
    
    lazy var blueAnimationView : UIView = {
        let blueAnimationView = UIView()
        blueAnimationView.backgroundColor = .blue
        return blueAnimationView
    }()
    
    lazy var animationImageView : UIImageView = {
        let animationImageView = UIImageView()
        animationImageView.image = UIImage(named: "cornel_branch_tree")
        return animationImageView
    }()
    
    lazy var topAnimationImageView : UIImageView = {
        let topAnimationImageView = UIImageView()
        topAnimationImageView.image = #imageLiteral(resourceName: "Expression_1")
        return topAnimationImageView
    }()
    
    lazy var textLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .orange
        label.textColor = .white
        label.text = "《iOS核心动画高级技巧》"
        return label;
    }()
    @objc func animationMethod(){
        /**
             通过修改视图的属性：  frame,bounds,center,transform,alpha,backgroundColor
         */
        
        /** 动画曲线类型：
         easeInOut:动画播放速度在开始时较慢，然后逐渐加速，在完成之前再次变慢
         easeIn:动画播放速度在开始时较慢，然后在动画过程中逐渐加速
         easeOut:动画播放速度在开始时较快，然后在动画过程中逐渐减速
         Liner:动画插入速度在动画过程中始终保持不变
         
         */
        
//        UIView.animate(withDuration: 4, delay: 0, options: [.curveEaseOut]) {
//            let view = self.animationView
//            view.frame = CGRect(x: 30, y: 30, width: 0, height: 0)
//            view.backgroundColor = .blue
//            view.alpha = 0
//        } completion: { _ in
//
//        }

        //view的 transform 非常简单，也比较常用，就旋转平移缩放，可以叠加在一起使用
        UIView.animate(withDuration: 5) {
            self.blueAnimationView.transform = CGAffineTransform.identity
                .translatedBy(x: -100, y: 0)
                .rotated(by:CGFloat(Double.pi/4))
                .scaledBy(x: 0.5, y: 0.5)
        }
        
        //Spring 弹性动画
//        UIView.animate(withDuration: 1 , delay: 0 , usingSpringWithDamping: 0.3 , initialSpringVelocity: 8 , options: [] , animations: {
//          self.animationView.center.x -= 100
//        }, completion: nil)
        

        let image = #imageLiteral(resourceName: "cornel_branch_tree")
        let otherimage = #imageLiteral(resourceName: "green_plant")
        //Transitions 过渡
        UIView.transition(with: self.animationImageView , duration: 0.6 , options: .transitionFlipFromLeft , animations: {
            if self.animationImageView.image ==  image {
                self.animationImageView.image = otherimage
            }else{
                self.animationImageView.image = image
            }
        }, completion: nil)

//        UIView.transition(from: , to:, duration:, options:, completion:) 这个方法需要两个view ，第一个会被第二个替换掉。
        
        uiimageviewAnimation()
        KeyframeAnimation()
    }
    
    @objc func CAAnimationMethod(){
        self.navigationController?.pushViewController(SwiftCAAnimationViewController(), animated: true)
    }
    
    @objc func CAAnimationMethod2(){
        self.navigationController?.pushViewController(SwiftCAAnimationViewControllerTwo(), animated: true)
    }
    
    @objc func CAAnimationMethod3(){
//        self.navigationController?.pushViewController(SwiftCAAnimationViewControllerThree(), animated: true)
    }
    
    
    @objc func cancelanimationMethod(){
        self.animationView.layer.removeAllAnimations() //取消动画
        self.blueAnimationView.transform = CGAffineTransform.identity //回到原位
    }
    
    
    func uiimageviewAnimation(){

        let imageView = UIImageView()
        imageView.animationImages = [UIImage(named: "ww_imgs_refresh_footer_img_1")!,
                                     UIImage(named: "ww_imgs_refresh_footer_img_2")!,
                                     UIImage(named: "ww_imgs_refresh_footer_img_3")!,
                                     UIImage(named: "ww_imgs_refresh_footer_img_4")!]
//        imageView.animationRepeatCount = 5
        imageView.animationDuration = 1
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.equalTo(self.animationView.snp_bottom).offset(100)
            $0.width.height.equalTo(100)
        }
        imageView.startAnimating()
    }
    
    func KeyframeAnimation(){
        //Keyframe 关键帧动画
        var p = self.animationView.center
        let dur = 0.25
        var start = 0.0
        let dx: CGFloat = -100
        let dy: CGFloat = 50
        var dir: CGFloat = 1

        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
          UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
            p.x += dx*dir
            p.y += dy
            self.animationView.center = p
          })
          start += dur
          dir *= -1
          UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
            p.x += dx*dir
            p.y += dy
            self.animationView.center = p
          })
          start += dur
          dir *= -1
          UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
            p.x += dx*dir
            p.y += dy
            self.animationView.center = p
          })
          start += dur
          dir *= -1
          UIView.addKeyframe(withRelativeStartTime: start , relativeDuration: dur , animations: {
            p.x += dx*dir
            p.y += dy
            self.animationView.center = p
          })
        }, completion: nil)

        //CAKeyframeAnimation 关键帧动画
        /**
            1.设置关键帧动画的视图属性，比如opacity，position，transform，bounds
            2.设置属性开始，中间，结束等多个阶段时的值
            3.设置两个关键帧之间的时长
            4.设置整个动画的播放时长
         */
        let animation = CAKeyframeAnimation(keyPath: "position")//MRAK: keypath 字符小心打错
        let point1 = CGPoint(x: 150, y: 100)
        let point2 = CGPoint(x: 280, y: 100)
        let point3 = CGPoint(x: 100, y: 300)
        let point4 = CGPoint(x: 280, y: 300)

        animation.values = [NSValue(cgPoint: point1),
                            NSValue(cgPoint: point2),
                            NSValue(cgPoint: point3),
                            NSValue(cgPoint: point4)]

        animation.keyTimes = [NSNumber(value: 0.0),
                              NSNumber(value: 0.4),
                              NSNumber(value: 0.6),
                              NSNumber(value: 1.0)]
        animation.delegate = self
        animation.duration = 5

        self.topAnimationImageView.layer.add(animation,forKey: "Move")
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        debugPrint("animation start")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        debugPrint("animation stop")
    }
    @objc func jumpMethod(){
        self.navigationController?.pushViewController(SwiftSoundVideoVC(), animated: true)
    }
}
