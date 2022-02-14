//
//  SwiftSlideAnimationMuneView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/14.
//  Copyright © 2022 Zoujie. All rights reserved.
//
/*
 1.添加模糊背景
 2.划入菜单栏
 3.思考：如何让view动起来？多次绘制（动画基于绘制）
 4.通过2个辅助view，求出它们的插值，获取到一组动态的数据
 5.CADisplayLink
 6.添加按钮
 */
import UIKit
let menuBlankWidth = 50
let menuBtnHeight = 40
let buttonSpace = 30
class SwiftSlideAnimationMuneView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(_: [String]) {
        self.init()
        
    }
    
    func switchAction(){
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
