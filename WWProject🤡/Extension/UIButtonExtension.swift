//
//  UIButtonExtension.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/15.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

extension UIButton {
    
    private struct customEdgeInset {
        
        static var top: String = "topkey"
        static var left: String = "leftkey"
        static var bottom: String = "botkey"
        static var right: String = "rightkey"
    }
    //MARK: 扩展button 点击范围
    func setEnlargeEdge(_ top : CGFloat ,_ bot: CGFloat,_ left: CGFloat,_ right: CGFloat) {
        //https://www.jianshu.com/p/a62931409de2
        objc_setAssociatedObject(self, &customEdgeInset.top, top, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(self, &customEdgeInset.left, left, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(self, &customEdgeInset.right, right, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        objc_setAssociatedObject(self, &customEdgeInset.bottom, bot, .OBJC_ASSOCIATION_COPY_NONATOMIC)
     
    }
    func returnRect() -> CGRect{
        let top: CGFloat = objc_getAssociatedObject(self, &customEdgeInset.top) as? CGFloat ?? 0
        let left: CGFloat = objc_getAssociatedObject(self, &customEdgeInset.left) as? CGFloat ?? 0
        let bot: CGFloat = objc_getAssociatedObject(self, &customEdgeInset.bottom) as? CGFloat ?? 0
        let right: CGFloat = objc_getAssociatedObject(self, &customEdgeInset.right) as? CGFloat ?? 0
        if top>0 || left>0 || bot>0 || right>0 {
            return CGRect(x: self.bounds.origin.x-left, y: self.bounds.origin.y-top, width: self.bounds.size.width+left+right, height: self.bounds.size.height+top+bot)
        }else {
            return self.bounds
        }
    }
    //TODO 导航栏按钮 点击偏移
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let rect = returnRect()
        if rect.contains(point) {
//            print("当前点击位置",point)
            return self
        }else {
            return nil
        }
    }
//    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        let rect = returnRect()
//        return rect.contains(point)
//    }
}
