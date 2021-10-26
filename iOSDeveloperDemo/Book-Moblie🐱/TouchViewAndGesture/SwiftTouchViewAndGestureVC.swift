//
//  SwiftTouchViewAndGestureVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/24.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftTouchViewAndGestureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //1.触摸事件的检测
        //1）触摸事件阶段的检测
        //2）检测是否触摸到某个视图
        checkTouchView()
        //3）实现视图的拖动
        
        //2.触摸手势的使用
        //1）单点触摸手势
        tapOneGesture()
        //2) 双点触摸手势
        tapDouble()
        //3) 长按手势
        //4) 捏合手势
        
        //3.3D touch
    }
    
    
    
    //1）触摸事件阶段的检测 4个方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan\(String(describing: touches.first?.view))")
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch : UITouch = touches.first!
        let point : CGPoint =  touch.location(in: oneView)
        print("touchesMoved\(point)")
   
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled")
    }//系统应用 打断  eg：电话
    
    /**
     普通的 iphone 应用开发中不会用到这个方法，这个方法是为了 Apple Pencil 的特性设计的，主要见于 Apple Pencil 和 iPad 的联动应用中，例如用 Apple Pencil 在 iPad 上画画。
     主要的原因是 Apple Pencil 产生的 touch 事件的部分信息（如 Pencil 的方向等）传递到 iPad 或 iPhone 上会有一定的延时。
     */
    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
        print("touchesEstimatedPropertiesUpdated")
        let touches = touches
        print(touches.first?.tapCount as Any)
    }
    //2）检测是否触摸到某个视图
    var oneView : UIView = {
       let oneView = UIView()
        oneView.backgroundColor = UIColor.orange
        return oneView
    }()
    func checkTouchView(){
        
        self.view.addSubview(self.oneView)
        oneView.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.left.equalTo(self.view.snp_left).offset(100)
            $0.top.equalTo(self.view.snp_top).offset(200)
        }
    }
    //3）实现视图的拖动
    
    
    //1）单点触摸手势
    func tapOneGesture(){
//        let ges = UITapGestureRecognizer.init()
        let ges = UITapGestureRecognizer.init(target: self, action: #selector(SwiftTouchViewAndGestureVC.oneTapClick))
        
//        ges.numberOfTapsRequired = 1
//        ges.addTarget(self, action: #selector(oneTapClick))
        oneView.isUserInteractionEnabled = true
        oneView.addGestureRecognizer(ges)
        
    }
    
    @objc func oneTapClick(){
        print("Tap Tap Tap")
    }
    //2) 双点触摸手势
    var doubleView : UIView = {
       let doubleView = UIView()
        doubleView.backgroundColor = UIColor.green
        return doubleView
    }()
    func tapDouble(){
        self.view.addSubview(self.doubleView)
        self.doubleView.snp.makeConstraints {
            $0.width.height.equalTo(50)
            $0.center.equalTo(self.view)
        }
        
        let doubleGes = UITapGestureRecognizer.init()
        doubleGes.addTarget(self, action: #selector(doubleTapMethod))
        doubleGes.numberOfTapsRequired = 2
        self.doubleView.addGestureRecognizer(doubleGes)
    }
    
    @objc func doubleTapMethod(){
        print("Doubel Tap")
    }
    
    //3) 长按手势
    func longPressGesture(){
        
    }
    
    //4) 捏合手势
    func pinGesture(){
        
    }
    
    //3.3D touch

    
    
    
}
