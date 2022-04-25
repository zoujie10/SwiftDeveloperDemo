//
//  TemplateClass.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 6/10/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
/*
 模板模式
 1.iOS系统类 viewcontroller控制器 生命周期，ttableview回调等，一套恒定完整的流程中，个别自定义实现方法
 */
@objc protocol TemplateClass {
    @objc optional func makeFire()
    @objc func buyProducts()
    @objc optional func onPlate()
}

class MakeFood: TemplateClass {
    
    func lineToEat(){
        self.buyProducts()
        self.makeFire()
        self.onPlate()
        self.goToEat()
    }
    
    func makeFire() {
        print("Fire")
    }
    
    func buyProducts() {
        print("buyProducts")
    }
    
    func onPlate() {
        print("onPlate")
    }
    
    func goToEat(){
        print("eat")
    }

}

