//
//  ConcreteAggregrate.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 6/11/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
/*
    把容器元素转换为迭代器对象
 */
class ConcreteAggregrate: NSObject {
    
    var array : [String]
    
    init(array : [String]) {
        self.array = array
    }
    
    func addObject(object:String){
        self.array.append(object)
    }
    
    func removeObject(index : NSInteger) -> Array<String>{
        return [self.array.remove(at: index)]
    }
    
    func itertorcOncreate() -> IteratorClass{
        return IteratorClass.init(array: array)
    }
    
    
}
