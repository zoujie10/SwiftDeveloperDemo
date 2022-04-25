//
//  WW_DefaultBehavior.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/3.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_DefaultBehavior: UIDynamicBehavior {
    
    override init() {
        super.init()
        let collisionBehavior = UICollisionBehavior.init()
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        self.addChildBehavior(collisionBehavior)
        
        let gravityBehavior = UIGravityBehavior.init()
        self.addChildBehavior(gravityBehavior)
    }
    
    func addItem(item : UIDynamicItem){
        for behavior : AnyObject in self.childBehaviors{
            behavior.addItem(item)
            
        }
    }
    
    func removeItem(item : UIDynamicItem){
        for behavior : AnyObject in self.childBehaviors{
            behavior.removeItem(item)
            
        }
    }
}
