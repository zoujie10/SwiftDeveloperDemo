//
//  WW_DraggableView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/3.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_DraggableView: UIView,NSCopying {

    var snapBehavior : UISnapBehavior?
    var dynamicAnimator : UIDynamicAnimator?
    var gestureRecognizer : UIGestureRecognizer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame:CGRect,animator:UIDynamicAnimator) {
        self.init(frame: frame)
        dynamicAnimator = animator
//        snapBehavior = UISnapBehavior.init(item: <#T##UIDynamicItem#>, snapTo: <#T##CGPoint#>)
        
        self.backgroundColor = UIColor.random
        let num = Int.randomIntNumber(lower: 0, upper: 2)//图片名称随机
        let imageView = UIImageView()
        let imageStr = "football_black_\(num)"
        imageView.image = UIImage(named: imageStr)
        imageView.frame = CGRect(x: 5, y: 5, width: 90, height: 90)
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
//        self.layer.borderWidth = 1
//        self.layer.cornerRadius = 10;
//        self.layer.borderColor =[[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]CGColor];

        
        gestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(handlePan))
        self.addGestureRecognizer(gestureRecognizer!)
    }
    
    
    @objc func handlePan(ges:UIPanGestureRecognizer){
        if ges.state == .ended || ges.state == .cancelled{
            self.stopDragging()//手势结束
        }else{
            self.dragToPoint(point: ges.location(in: self.superview))//拖曳视图
        }
    }
    
    func dragToPoint(point : CGPoint){
//        self.dynamicAnimator?.removeBehavior(self.snapBehavior!)
        self.snapBehavior = UISnapBehavior.init(item: self, snapTo: point)
        self.snapBehavior!.damping = 0.25
        self.dynamicAnimator?.addBehavior(self.snapBehavior!)
    }
    
    func stopDragging(){
        self.dynamicAnimator?.removeBehavior(self.snapBehavior!)
//        self.snapBehavior = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let newView = WW_DraggableView(frame: CGRect.zero, animator: self.dynamicAnimator!)
        newView.bounds = self.bounds
        newView.center = self.center
        newView.transform = self.transform
        newView.alpha = self.alpha
        return newView;
    }

}
