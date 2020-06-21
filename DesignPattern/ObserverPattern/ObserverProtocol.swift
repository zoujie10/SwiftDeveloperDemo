//
//  File.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 5/16/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import Foundation
//观察模式流程
//添加观察者
//移除观察者
//通知观察者
protocol ObserverDelegate{
    func Valuechange(value : Any)
    func Valuechange()
    func addObserver(ob : Observer)
    func removeObserver(index : NSInteger)
}
