//
//  SwiftCubeDisplayView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/27.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import SwiftUI
/*
 1.6个面（layer）
 2.layer做一个3d转换（平移、旋转）
 3.通过CATransform3D在变换
 4.把每个面的layer再添加到CATransformLayer
 5.把CATransformLayer添加在self.view.layer上
 
 */
class SwiftCubeDisplayView: UIView {
   
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        let cubeLayer = CATransformLayer.init()
        
        //1. (上)
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cubeLayer.addSublayer(self.faceWithTransform(transform: ct))
        //2.（右）
        ct = CATransform3DMakeTranslation(50,0,0)
        ct = CATransform3DRotate(ct, Double.pi/2, 0, 1, 0)//围绕y轴 旋转
        cubeLayer.addSublayer(self.faceWithTransform(transform: ct))
        //3.（后）
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, Double.pi/2, 1, 0, 0)
        cubeLayer.addSublayer(self.faceWithTransform(transform: ct))
        //4.（前）
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, Double.pi/2, 1, 0, 0)
        cubeLayer.addSublayer(self.faceWithTransform(transform: ct))
        //5.（左）
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, Double.pi/2, 0, 1, 0)
        cubeLayer.addSublayer(self.faceWithTransform(transform: ct))
        //6.(下)
        ct = CATransform3DMakeTranslation(0, 0, -50)
        cubeLayer.addSublayer(self.faceWithTransform(transform: ct))
//        print(NSStringFromCGPoint(self.center))
        cubeLayer.position = CGPoint(x: 50, y: 50)
        cubeLayer.transform = CATransform3DMakeRotation(Double.pi/4, 1, 1,0)
        self.layer.addSublayer(cubeLayer)
    }

    func faceWithTransform(transform : CATransform3D)  -> CALayer{
        let layer = CALayer.init()
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        layer.backgroundColor = UIColor.random.cgColor
        
        layer.transform = transform
        return layer
    }
}
