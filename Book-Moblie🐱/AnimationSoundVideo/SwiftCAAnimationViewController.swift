//
//  SwiftCAAnimationViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/8.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class SwiftCAAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeUI()
    }
    func makeUI(){
        self.view.addSubview(self.animationImageView)
        self.animationImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(200)
        }
    }
    
    func animationGroup(){
        //    曲线
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 50, y: 350))
        path.addCurve(to: CGPoint(x: 300, y: 350), controlPoint1: CGPoint(x: 180, y: 250), controlPoint2: CGPoint(x: 200, y: 450))
        
        //需要添加在layer上
        let shapeLayer = CAShapeLayer.init()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.red.cgColor
        self.view.layer.addSublayer(shapeLayer)
        
        let colorlayer = CAShapeLayer.init()
        colorlayer.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        colorlayer.position = CGPoint(x: 50, y: 350)
        colorlayer.backgroundColor = UIColor.blue.cgColor
        colorlayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        self.view.layer.addSublayer(colorlayer)
        
        //    过山车的动画
        let anim = CAKeyframeAnimation.init()
        anim.keyPath = "position"
        anim.path = path.cgPath
//        anim.duration = 4.0
//        anim.isRemovedOnCompletion = false
//        anim.fillMode = kCAFillModeForwards
//        anim.rotationMode = kCAAnimationRotateAuto
//        carLayer.add(anim, forKey: nil)
        
        let sizeAnim = CABasicAnimation.init()
        sizeAnim.keyPath = "transform.scale"
        sizeAnim.toValue = 0.5
        
        let colorAnim = CABasicAnimation.init()
        colorAnim.keyPath = "backgroundColor"
        colorAnim.toValue = UIColor.random.cgColor
        
        let group = CAAnimationGroup.init()
        group.animations = [anim,sizeAnim,colorAnim]
        group.duration = 4.0
        group.fillMode = kCAFillModeForwards
        group.isRemovedOnCompletion = false
        colorlayer.add(group, forKey: nil)
    }
    
    func carAnimationMethod(){
        //    曲线
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 50, y: 150))
        path.addCurve(to: CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 180, y: 50), controlPoint2: CGPoint(x: 200, y: 250))
        
        let carLayer = CALayer.init()
        carLayer.frame = CGRect(x: 16, y: 150-30, width: 45, height: 45)
        carLayer.contents = UIImage(named: "ww_imgs_refresh_footer_img_1")?.cgImage
        carLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        self.view.layer.addSublayer(carLayer)
        //需要添加在layer上
        let shapeLayer = CAShapeLayer.init()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.red.cgColor
        self.view.layer.addSublayer(shapeLayer)
        
        //    过山车的动画
        let anim = CAKeyframeAnimation.init()
        anim.keyPath = "position"
        anim.path = path.cgPath
        anim.duration = 4.0
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        anim.rotationMode = kCAAnimationRotateAuto
        carLayer.add(anim, forKey: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        let anim = CAKeyframeAnimation.init()
        anim.keyPath = "transform.rotation"
        anim.values = [-6/180*Double.pi,6/180*Double.pi]
        anim.repeatCount = MAXFLOAT
        anim.autoreverses = true
        anim.speed = 2
        self.animationImageView.layer.add(anim, forKey: nil)
        
        carAnimationMethod()
        animationGroup()
    }
    
    lazy var animationImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "中国")
        return imageView
    }()
}
/*
 动画三步骤：
 1.初始化动画对象
 2.设置需要修改的动画属性的值
 3.把动画添加到layer（所有的动画都是添加在layer上，不是view）
 
 你看到的都是假象，真正的view是没有发生变化的
 postition:（layer里面设置中心点） center:uiview
 presentationLayer和modelLayer（呈现层和模型层）
 
 锚点：1.概念；2.单位坐标0-1；3.和position的关系：就是锚点在父视图的位置
 
 隐式动画：默认时间0.25s(位置，颜色，大小),必须是独立的layer才有隐式动画，uiview（根layer）
 显示动画：
 */
