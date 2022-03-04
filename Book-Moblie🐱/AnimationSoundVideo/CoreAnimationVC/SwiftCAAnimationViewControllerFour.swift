//
//  SwiftCAAnimationViewControllerFour.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/2.
//  Copyright © 2022 Zoujie. All rights reserved.
//


import UIKit

class SwiftCAAnimationViewControllerFour: UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = .white

        creatUI()
        explosion()
        configAnimatorAnimation()
    }
    
    func creatUI(){
        self.view.addSubview(self.clickBtn)
        self.clickBtn.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
    //MARK:点赞动画效果： 1.伸缩效果 2.离子火花
    //添加爆炸效果
    func explosion(){
        self.emitterLayer.frame = self.clickBtn.bounds
        self.emitterLayer.emitterPosition = CGPoint(x: self.emitterLayer.frame.width+10, y: self.emitterLayer.frame.size.height+10)//MARK: ？ 为毛不准 偏左上角
        self.clickBtn.layer.addSublayer(self.emitterLayer)
    }
    
    func addExplosionAnim(){
        self.emitterLayer.beginTime = CACurrentMediaTime()
        self.emitterLayer.birthRate = 1
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.emitterLayer.birthRate = 0;
        }
    }
    
    @objc func changeImage(sender : UIButton){
        sender.isSelected = !sender.isSelected
        //关键帧动画
        let anim = CAKeyframeAnimation.init(keyPath: "transform.scale")
        if sender.isSelected{
            anim.values = [2,0.8,1,1.2,1]
            anim.duration = 0.6
            addExplosionAnim()
        }else{
            anim.values = [0.8,1.0]
            anim.duration = 0.4
        }
        sender.layer.add(anim, forKey: nil)
    }
    
    lazy var clickBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "animation_click_default"), for: .normal)
        btn.setImage(UIImage(named: "animation_click_select"), for: .selected)
        btn.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
        return btn
    }()
    
    lazy var emitterLayer : CAEmitterLayer = {
        let layer = CAEmitterLayer.init()
        let cell = CAEmitterCell.init()
        cell.name = "explosionCell"
        cell.lifetime = 0.7;
        cell.birthRate = 4000;
        cell.velocity = 50;//中间值
        cell.velocityRange = 15;//(50+-15)
        cell.scale = 0.05;
        cell.scaleRange = 0.02;
        cell.contents = UIImage(named: "animation_sparkle_cell")?.cgImage
        //设置粒子系统大小，位置，方向
        layer.name = "explosionLayer"
        layer.emitterShape = kCAEmitterLayerCircle
        layer.emitterMode = kCAEmitterLayerOutline
        layer.emitterSize = CGSize(width: 25, height: 25)
        layer.emitterCells = [cell]
        layer.renderMode = kCAEmitterLayerOldestFirst
        layer.masksToBounds = false
        layer.birthRate = 0;
        
        return layer
    }()
    
    
    /*
     QQ消息气泡拉拽动画
     拆分：
     1.2个圆（一个是固定圆，一个是可拖动的圆）
     2.贝塞尔画形状
     3.拖动的时候固定圆的比例是缩小的
     4.到一定距离的时候会断开
     5.松开手势就会回弹到原地
     */
    
    
    
    /*
     UI动力学
     物理引擎 ios7Dynamics库（逼真交互设计，自由落体，碰撞，吸附）
     UIDynamicAnimator
     
     思路：
     1.实例化UIDynamicAnimator
     2.添加一些行为
     3.把行为添加到UIDynamicAnimator
     */
    
    var animator : UIDynamicAnimator?
    var defaultBehavior : WW_DefaultBehavior?
    func configAnimatorAnimation(){
        //容器（行为）
        self.animator = UIDynamicAnimator.init(referenceView: view)

        let frame = CGRect(x: 0, y: 0, width: 60, height:60)
        let dragView = WW_DraggableView.init(frame: frame, animator: self.animator!)
        dragView.center = CGPoint(x: self.view.center.x/4, y: self.view.center.y/4)
        dragView.alpha = 0.5
        self.view.addSubview(dragView)
        
        let defaultBehavior = WW_DefaultBehavior.init()
        self.animator?.addBehavior(defaultBehavior)
        self.defaultBehavior = defaultBehavior
        
        let tearOffBehavior = WW_FallFreeBehavior.init(view: dragView, anchor: dragView.center) { tornView, newPinView in
            tornView.alpha = 1
            defaultBehavior.addItem(item: tornView)
            
        }
        self.animator?.addBehavior(tearOffBehavior)
        
        
        
        
//        //添加自由落体的行为
//        let gravity = UIGravityBehavior.init(items: array)
//        self.animator.addBehavior(gravity)
//        //添加碰撞行为
//        let collision = UICollisionBehavior.init(items: array)
//        collision.translatesReferenceBoundsIntoBoundary = true
////        collision.collisionMode = .everything
//        self.animator.addBehavior(collision)
//        //添加弹性系数
//        let itemBehavior = UIDynamicItemBehavior.init(items: array)
//        itemBehavior.elasticity = 0.6
//        self.animator.addBehavior(itemBehavior)
//
//        //添加拖拽手势
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(panAction))
        footballTwo.addGestureRecognizer(pan)
     
    }
    
    @objc func panAction(ges : UIPanGestureRecognizer){
       
//        if ges.state == .began{
//            
//            let offsetPoint = UIOffset(horizontal: -30, vertical: -30)
//            attach = UIAttachmentBehavior.init(item: footballTwo, offsetFromCenter: offsetPoint, attachedToAnchor: ges.location(in: self.view))
//            self.animator.addBehavior(attach!)
//        
//        }else if ges.state == .changed{
//            attach!.anchorPoint = ges.location(in: view)
//     
//        }else if ges.state == .ended || ges.state == .failed || ges.state == .cancelled{
//            self.animator.removeBehavior(attach!)
//        }
    
        
    }
    lazy var footballOne : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "football_black_1")
        imageView.frame = CGRect(x: 5, y: 5, width: 90, height: 90)
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
        return imageView
    }()
    lazy var footballTwo : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "football_blue_1")
        imageView.frame = CGRect(x: 45, y: 15, width: 90, height: 90)
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
        return imageView
    }()
    lazy var footballThree : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "football_lightblue_1")
        imageView.frame = CGRect(x: 85, y: 5, width: 90, height: 90)
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
        return imageView
    }()
}
