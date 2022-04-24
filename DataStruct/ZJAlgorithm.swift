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
}

//TODO:https://blog.csdn.net/lin1109221208/article/details/90673080
class ZJ_Bubbling_Algorithm{
    
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
        print("bubbling algorithm = ",array)
        print("循环次数:",count)
    }
    
    //外层优化
    func Sort_Bubbling_OutSide_optimize(){
        var array = [12,14,19,14,15,12,123,1234,33]
        var count = 0
        for i in 0 ..< array.count{
            var jump = true
            count = i
            for j in i+1 ..< array.count{
                if array[j] < array[i]{
                    jump = false
                    array.swapAt(i, j)
                }
                if jump{
                    break
                }
            }
        }
        print("outside:",count)
        print(array)
    }
    //内层优化
    func Sort_Bubbling_Inner_optimize(){
        var array = [12,14,19,14,15,12,123,1234,33]
        var swap = 0
        var k = array.count - 1
        var count = 0
        for i in 0 ..< array.count {
            var flag = true
            count = i
            for j in 0 ..< k{
                if array[j] > array[j+1]{
                    array.swapAt(j, j+1)
                    flag = false
                    swap = j
                }
            }
            k = swap
            if flag{
                break
            }
        }
        print(array)
        print(count)
    }
}

class ZJ_Choose_Sorted_Algorithm{
    /**
     1.线性搜索找到最小值
     2.交换位置到最左边
     3.依次循环
     */
    func chooseSorted_Algorithm(){
        var array = [12,14,19,14,15,12,123,1234,33]
        for i in 0 ..< array.count{
            var min = i
            for j in i+1 ..< array.count{
                if array[j] < array[min]{
                    min = j
                }
            }
            array.swapAt(i, min)
        }
        print("choose selected algorithm = ",array)
    }
}
