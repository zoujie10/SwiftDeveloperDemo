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
        //touchesMoved
        
        //2.触摸手势的使用
        //1）单点触摸手势
        tapOneGesture()
        
        //2) 双点触摸手势
        tapDouble()
       
        //3) 长按手势
        longPressGesture()
       
        //4) 捏合手势
        pinchGesture()
    
        //3.3D touch
    }
    
    
    
    //1）触摸事件阶段的检测 4个方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touchesBegan\(String(describing: touches.first?.view))")
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch : UITouch = touches.first!
        let point : CGPoint =  touch.location(in: oneView)
        print("touchesMoved\(point)")
        self.doubleView.frame.origin = point
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
    lazy var oneView : UIView = {
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
    lazy var doubleView : UIView = {
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
    var isLongPress : Bool = true
    lazy var longPressView : UIImageView = {
       let longPressView = UIImageView()
        longPressView.image = UIImage.init(named: "达芬奇-蒙娜丽莎")
        longPressView.isUserInteractionEnabled = true
        return longPressView
    }()
    
    func longPressGesture(){
        let longPress = UILongPressGestureRecognizer.init()
        longPress.addTarget(self, action: #selector(longPressMethod))
        longPress.minimumPressDuration = 2
        
        self.view.addSubview(self.longPressView)
        self.longPressView.snp.makeConstraints {
            $0.width.height.equalTo(200)
            $0.centerY.equalTo(self.oneView)
            $0.left.equalTo(self.oneView.snp_right).offset(20)
        }
        self.longPressView.addGestureRecognizer(longPress)
        
    }
    
    @objc func longPressMethod(sender : UILongPressGestureRecognizer){
        if(self.isLongPress == true){
            self.longPressView.image = longPressView.image?.scaleTo(fitSize: CGSize.init(width: 100, height: 100))
            
            self.longPressView.snp.updateConstraints {
                $0.width.height.equalTo(100)
                $0.centerY.equalTo(self.oneView)
                $0.left.equalTo(self.oneView.snp_right).offset(20)
            }
            self.isLongPress = false
        }
     
    }
    
    //4) 捏合手势
    lazy var pinGesImageView : UIImageView = {
        let pinGesImageView = UIImageView()
        pinGesImageView.isUserInteractionEnabled = true
        pinGesImageView.image = UIImage.init(named: "fruiticons_buttons_orange")
        return pinGesImageView
    }()
    func pinchGesture(){
        let pinGes = UIPinchGestureRecognizer.init()
        pinGes.addTarget(self, action: #selector(pinGesMethod))
        
        self.view.addSubview(self.pinGesImageView)
        self.pinGesImageView.snp.makeConstraints {
            $0.width.height.equalTo(300)
            $0.bottom.equalTo(self.view.snp_bottom).offset(-100)
            $0.right.equalTo(self.view.snp_right).offset(-100)
        }
        self.pinGesImageView.addGestureRecognizer(pinGes)
    }
    
    @objc func pinGesMethod(sender : UIPinchGestureRecognizer){
        print("\(sender.scale)+++\(sender.velocity)")
    }
    //3.3D touch
    func threeDtouch() {
        let addEventsIcon = UIApplicationShortcutIcon.init(type: .add)
        let jumpGesVCIcon = UIApplicationShortcutIcon.init(templateImageName: "搜索")
        let jumpComponentVCIcon = UIApplicationShortcutIcon.init(templateImageName: "ww_shoping_carts_submit_Integration_reduce")
        
        
        let addEvent = UIApplicationShortcutItem.init(type: "add.Event", localizedTitle:  "添加时间" , localizedSubtitle: nil, icon: addEventsIcon, userInfo: nil)
        let jumpGesEvent = UIApplicationShortcutItem.init(type: "jump.Event", localizedTitle:  "跳转手势VC" , localizedSubtitle: nil, icon: jumpGesVCIcon, userInfo: nil)
        let jumpComponentsEvent = UIApplicationShortcutItem.init(type: "jump.components.Event", localizedTitle:  "跳转UI组件VC" , localizedSubtitle: nil, icon: jumpComponentVCIcon, userInfo: nil)
        
        let Itmes = [addEvent,jumpGesEvent,jumpComponentsEvent]
//        application.shortcutItems = Itmes
        print(Itmes)
    }
    
}
