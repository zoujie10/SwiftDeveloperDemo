//
//  WW_FallFreeBehavior.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/3.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_FallFreeBehavior: UIDynamicBehavior {
    
    var _active = true
    typealias fallFreePathBlock = (_ tornView : WW_DraggableView,_ newPinView:WW_DraggableView) -> ()
    var fallFreePath_Block : fallFreePathBlock?
    
    override init() {
        super.init()
    }
    
    convenience init(view:WW_DraggableView,anchor : CGPoint,handler:@escaping fallFreePathBlock) {
        self.init()
        _active = true
        self.addChildBehavior(UISnapBehavior.init(item: view, snapTo: anchor))
        let distance = min(view.bounds.size.width, view.bounds.size.height)
        
        self.action = { [self] in
            if !self.pointsAreWithinDistance(p1: view.center, p2: anchor, distance:distance){
                if _active{
                    let newView = view.copy()
                    view.superview?.addSubview(newView as! WW_DraggableView)
                    let newTearOff = WW_FallFreeBehavior.init(view: newView as! WW_DraggableView, anchor: anchor, handler: handler)
                    newTearOff._active = false
                    self.dynamicAnimator?.addBehavior(newTearOff)
                    
                    handler(view,newView as! WW_DraggableView)
                    
                    self.dynamicAnimator?.removeBehavior(self)
                }
            }else{
                _active = true
            }
        }
    }
    
   
    /*
     hypoty
     功能：对于给定的直角三角形的两个直角边，求其斜边的长度。
     说明：返回斜边值。
     */
    func pointsAreWithinDistance(p1 : CGPoint,p2 : CGPoint,distance : CGFloat) -> Bool{
        let dx = p1.x - p2.x
        let dy = p1.y - p2.y
        let currentDistance = hypotf(Float(dx),Float(dy))
        return Float(currentDistance) < Float(distance)
    }
}
