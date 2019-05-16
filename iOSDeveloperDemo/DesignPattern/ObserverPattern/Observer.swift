//
//  Observer.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 5/16/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class Observer: ObserverDelegate {
    
    func Valuechange(value: Any) {
        print("被观察者 ---value",(value),"over")
    }
    func Valuechange() {
        print("被观察者 改变")
    }
}
