//
//  Observerd.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 5/16/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class Observerd: ObserverDelegate {
    var ob = Observer()
    var changed : Bool
    var obArray = Array<Observer>()//观察者
    init() {
        changed = false
    }
    
    func Valuechange() {
        ob.Valuechange()
    }
    
    func Valuechange(value: Any) {
        
        for ob in obArray{
            ob.Valuechange(value: value)//给所有观察者发送消息
        }
    }
    
    func addObserver(ob: Observer) {
        obArray.append(ob)
    }
    func removeObserver(index: NSInteger) {
        obArray.remove(at: index)
    }
}
