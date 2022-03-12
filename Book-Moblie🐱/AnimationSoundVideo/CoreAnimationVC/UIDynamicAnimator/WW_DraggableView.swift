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
        self.layer.cornerRadius = 30
        dynamicAnimator = animator
        
//        self.backgroundColor = UIColor.random
        let num = Int.randomIntNumber(lower: 1, upper: 4)//图片名称随机
        print("randomIntNumber --- ",num)
        let imageView = UIImageView()
        let imageStr = "football_\(num)"
        imageView.image = UIImage(named: imageStr)
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
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
        if self.snapBehavior != nil{
            self.dynamicAnimator!.removeBehavior(self.snapBehavior!)
        }
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
