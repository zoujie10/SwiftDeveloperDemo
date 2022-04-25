//
//  SwiftCAAnimationViewControllerFour.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/2.
//  Copyright © 2022 Zoujie. All rights reserved.
//


import UIKit
import SwiftUI

class SwiftCAAnimationViewControllerFour: UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "点赞/QQ消息气泡/UI动力学"
        creatUI()
        explosion()
        configAnimatorAnimation()
        QQbubbleAnimation()
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
     5.松开手势 ”>“ 大于自定义距离消失  ”<“ 自定义距离 就会回弹到原地
     */

    lazy var r1 : CGFloat = 0
    func QQbubbleAnimation(){
   
        view.addSubview(bubbleOneView)
        view.addSubview(bubbleTwoView)
        bubbleTwoView.addSubview(bubbleCountLabel)
        bubbleOneView.frame = CGRect(x: 236, y: 300, width: 40, height: 40)
        bubbleTwoView.frame = bubbleOneView.frame
        bubbleCountLabel.frame = bubbleTwoView.bounds
        //MARK：snp 去不到frame
//        bubbleOneView.snp.makeConstraints { make in
//            make.width.height.equalTo(40)
//            make.left.equalTo(view).offset(40)
//            make.bottom.equalTo(view).offset(-100)
//        }
//        bubbleTwoView.snp.makeConstraints { make in
//            make.width.height.equalTo(40)
//            make.left.equalTo(view).offset(40)
//            make.bottom.equalTo(view).offset(-100)
//        }
//        bubbleCountLabel.snp.makeConstraints { make in
//            make.edges.equalTo(bubbleTwoView)
//        }
        
        let ges = UIPanGestureRecognizer.init(target: self, action: #selector(panAction))
        bubbleTwoView.addGestureRecognizer(ges)
        
        oldViewFrame = bubbleOneView.frame
        oldViewCenter = bubbleOneView.center
        r1 = bubbleOneView.frame.size.width/2
    }
    
    @objc func panAction(ges : UIPanGestureRecognizer){

        if ges.state == .changed{
            //跟着手势移动
            bubbleTwoView.center = ges.location(in: self.view)
            if r1 < 5{
                bubbleOneView.isHidden = true
                shapeLayer.removeFromSuperlayer()
            }else{
                //计算出6个关键点，画贝塞尔曲线
                caculPoint()
            }
            
        }else if ges.state == .failed || ges.state == .ended || ges.state == .cancelled{
            shapeLayer.removeFromSuperlayer()
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseOut) { [self] in
                //长度大于5移除bubble和距离未到回弹
                if r1 < 5{
                    bubbleTwoView.isHidden = true
                }else{
                    bubbleTwoView.center = oldViewCenter
                }
            } completion: { isFinish in
                //不移除bubble 回弹
//                bubbleOneView.isHidden = false
//                r1 = oldViewFrame.size.width/2
//                bubbleOneView.frame = oldViewFrame
//                bubbleOneView.layer.cornerRadius = r1
            }

        }
    }
    
    func caculPoint(){

        //1.求出2个中心点
        let center1 = bubbleOneView.center
        let center2 = bubbleTwoView.center
        //2.计算2个中心点的距离 sqrtf平方根
        let dis = sqrtf(Float((center1.x - center2.x)*(center1.x - center2.x)+(center1.y - center2.y)*(center1.y - center2.y)))
        //3.计算正弦余弦
        //正弦是sin,余弦是cos.是相对直角三角形来说的，正弦是一个锐角的对边比斜边，余弦是一个锐角的临边比斜边。
        let sin = Float(center2.x - center1.x)/dis
        let cos = Float(center1.y - center2.y)/dis
        //4.计算半径
        let r1 = oldViewFrame.size.width/2 - CGFloat(dis)/20
        let r2 = bubbleTwoView.bounds.size.width/2
        self.r1 = r1
        print(self.r1)
        
        //5.计算6个关键点
        let PA = CGPoint(x: center1.x - CGFloat(cos)*r1, y: center1.y - CGFloat(sin)*r1)
        let PB = CGPoint(x: center1.x + CGFloat(cos)*r1, y: center1.y + CGFloat(sin)*r1)
        let PD = CGPoint(x: center2.x - CGFloat(cos)*r2, y: center2.y - CGFloat(sin)*r2)
        let PC = CGPoint(x: center2.x + CGFloat(cos)*r2, y: center2.y + CGFloat(sin)*r2)
        let PP = CGPoint(x: PB.x + CGFloat(sin)*CGFloat(dis)/2, y: PB.y - CGFloat(cos)*CGFloat(dis)/2)
        let PO = CGPoint(x: PA.x + CGFloat(sin)*CGFloat(dis)/2, y: PA.y - CGFloat(cos)*CGFloat(dis)/2)
        
        //6.画贝塞尔曲线
        let path = UIBezierPath.init()
        path.move(to: PA)
        path.addQuadCurve(to: PD, controlPoint: PO)//弯曲点
        path.addLine(to: PC)
        path.addQuadCurve(to: PB, controlPoint: PP)//弯曲点
        path.close()
        
        //7.修改_shapeLayer的path
        shapeLayer.path = path.cgPath
        view.layer.insertSublayer(shapeLayer, below: bubbleTwoView.layer)////避免shapeLayer 遮挡View的label
        
        //8.重新设置view的大小
        bubbleOneView.center = oldViewCenter
        bubbleOneView.bounds = CGRect(x: 0, y: 0, width: self.r1*2, height: self.r1*2)
        bubbleOneView.layer.cornerRadius = self.r1
    }
    
    lazy var oldViewFrame : CGRect = {
        let frame = CGRect()
        return frame
    }()
    
    lazy var oldViewCenter : CGPoint = {
        let center = CGPoint()
        return center
    }()
    
    lazy var shapeLayer : CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.red.cgColor
        return layer
    }()
    
    lazy var bubbleCountLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = .white
        label.text = "99+"
        label.layer.cornerRadius = 20
        return label;
    }()

    lazy var bubbleOneView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.red
        v.layer.cornerRadius = 20
        return v
    }()
    lazy var bubbleTwoView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.red
        v.layer.cornerRadius = 20
        return v
    }()
    
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
        dragView.alpha = 0.8
        self.view.addSubview(dragView)
        
        let defaultBehavior = WW_DefaultBehavior.init()
        self.animator?.addBehavior(defaultBehavior)
        self.defaultBehavior = defaultBehavior
        
        let tearOffBehavior = WW_FallFreeBehavior.init(view: dragView, anchor: dragView.center) { [self] tornView, newPinView in
            tornView.alpha = 1
            defaultBehavior.addItem(item: tornView)
            
            //Double-tap to trash    双击手势让视图消失
            let doubleTap = UITapGestureRecognizer.init(target: self, action: #selector(doubleTapDismissView))
            doubleTap.numberOfTapsRequired = 2
            tornView.addGestureRecognizer(doubleTap)
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

    }
    
    @objc func doubleTapDismissView(tap:UITapGestureRecognizer){
        let view = tap.view
        //爆炸效果
        let subviews = sliceView(view: view!, rows: 6, columns: 6)
//        let subviews = [UIView]()
        // Create a new animator
        let trashAnimator = UIDynamicAnimator.init(referenceView: self.view)
        // Create a new default behavior
        let defaultBehavior = WW_DefaultBehavior.init()
        
        for subview : UIView in subviews {
            // Add the new "exploded" view to the hierarchy
            self.view.addSubview(subview)
            defaultBehavior.addItem(item: subview as UIDynamicItem)
            // Create a push animation for each
            let push = UIPushBehavior.init(items: [subview as UIDynamicItem], mode:.instantaneous)
//            push.pushDirection = CGVector(dx: arc4random()/RAND_MAX, dy: arc4random()/RAND_MAX))
//            let randomNum : Int32 = arc4random_stir()
            push.pushDirection.dx = CGFloat(1000/RAND_MAX)
            push.pushDirection.dy = CGFloat(1000/RAND_MAX)
            trashAnimator.addBehavior(push)
            
            UIView.animate(withDuration: 1) {
                subview.alpha = 1
            } completion: { Bool in
                subview.removeFromSuperview()
                trashAnimator.removeBehavior(push)
            }
        }
        // Remove the old view
        self.defaultBehavior?.removeItem(item: view!)
        view?.removeFromSuperview()
    }
    
    func sliceView(view:UIView,rows:NSInteger,columns:NSInteger) -> [UIView]{

        UIGraphicsBeginImageContext(view.bounds.size)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage
        UIGraphicsEndImageContext()

        var views = [UIView]()
        let width = image?.width
        let height = image?.height

        for row in 0 ..< rows{
            for column in 0 ..< columns{
                let rect = CGRect(x: column*(width!/columns),
                                  y: row*(height!/rows),
                                  width: width!/columns,
                                  height: height!/rows)
//                let subimage = CGImageCreateWithImageInRect(image!, rect)
//                let subimage  = CGImage.cropping(image!)
                let imageView = UIImageView.init(image: UIImage(named: "animation_sparkle_cell"))
//                imageView.image = UIImage.init(cgImage: subimage as! CGImage)
////                CGImageRelease(subimage as! CGImage)
////                subimage = nil
//                let rect1 = view.frame.offsetBy(dx: view.frame.minX,dy: view.frame.minY)
                imageView.frame = rect
                
                self.emitterLayer.frame = imageView.bounds
                self.emitterLayer.emitterPosition = CGPoint(x: self.emitterLayer.frame.width+10, y: self.emitterLayer.frame.size.height+10)//MARK: ？ 为毛不准 偏左上角
                imageView.layer.addSublayer(self.emitterLayer)
                views.append(imageView)
            }
        }
        return views
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        self.animator?.removeAllBehaviors()
    }
    
}
