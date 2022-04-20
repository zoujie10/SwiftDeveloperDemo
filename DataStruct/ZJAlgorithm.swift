//
//  ZJAlgorithm.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/11.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class ZJAlgorithm: NSObject {
    override init() {
        super.init()
    }
  
    //TODO:https://blog.csdn.net/lin1109221208/article/details/90673080
    func Sort_Bubbling(){
        var array = [12,14,19,14,15,12,123,1234,33]
        var count = 0
        for i in 0 ..< array.count {
            count = i
            for j in i+1 ..< array.count{
                if array[j] < array[i]{
                    //swag method 1
                    array.swapAt(i, j)
                    //swag method 2
//                    let temp = array[j]
//                    array[j] = array[i]
//                    array[i] = temp
                }
            }
        }
        print(array)
        print("循环次数:",count)
    }
    
    
    
    
    //外层优化
    func Sort_Bubbling_OutSide_optimize(){
        var array = [12,14,19,14,15,12,123,1234,33]
    }
    //内存优化
    func Sort_Bubbling_Inner_optimize(){
        var array = [12,14,19,14,15,12,123,1234,33]
        
    }
}
