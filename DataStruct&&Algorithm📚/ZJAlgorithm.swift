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
            for j in 0 ..< k{ //每轮相邻对比交换位置 直到最小值 到第一个
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
            for j in i+1 ..< array.count{//循环一轮 依次对比 找最小值
                if array[j] < array[min]{
                    min = j
                }
            }
            array.swapAt(i, min)
        }
        print("choose selected algorithm = ",array)
    }
}
//https://www.jianshu.com/p/1fd62e4234b3
/*
 1:在函数里有两个循环，外循环依次查找数组中的每一个元素；这就是从数字堆中取最上面的数字的过程。变量x是有序部分结束和堆开始的索引。要记住的是，在任何时候，从0到x的位置数组都是有序的，剩下的则是无序的。

2:内循环则从x位置的元素开始查找。x是堆顶的元素，它有可能比前面的所有元素都小。内循环从有序数组的后面开始往前查找。每次找到一个大的元素，就交换它们的位置，直到内层循环结束，数组的前面部分依然是有序的，有序的元素也增加了一个
*/
class ZJ_Insert_Sort_Algorithm{
    
    func insert_Sort(){
        var a = [12,14,19,14,15,12,123,1234,33]
        for x in 1 ..< a.count {       // 1
            var y = x
            while y > 0 && a[y] < a[y - 1] { // 2
                a.swapAt(y - 1, y)
                y -= 1
            }
        }
        print("Insert sort Algorithm",a)
        print("reverse array ",a.reversed())
    }

}

class ZJ_Heap_Sort_Algorithm{
    
    
    func heap_Sort_Algorithm(){
//        var a = [12,14,19,14,15,12,123,1234,33]
      
    }
}

class ZJ_Merge_Sort_Algorithm{
    func merge_sort_Algorithm(){
        
    }
}
//策略：（divideand conquer, D&C）
//1.递归  2.分而治之
/**
 D&C解决问题的过程包括两个步骤。(1) 找出基线条件，这种条件必须尽可能简单。(2) 不断将问题分解（或者说缩小规模），直到符合基线条件
 */
class ZJ_Quick_Sort_Algorithm{

    func quick_sort_Algorithm(array : [Int])->[Int]{
       
        if array.count < 2{
            return array
        }else{
            let basicNum = array.first
            var leftArray = [Int]()
            var rightArray = [Int]()
            for i in 1 ..< array.count {
                if array[i] <= basicNum!{//倒序 >
                    leftArray.append(array[i])
                }
            }
            for i in 1 ..< array.count{
                if array[i] > basicNum!{//倒序 <=
                    rightArray.append(array[i])
                }
            }
            
            return self.quick_sort_Algorithm(array: leftArray)+[basicNum!]+self.quick_sort_Algorithm(array: rightArray)
        }
    }
}
//线性搜索 O(n)
class line_Search{
   
    func line_search_Method(){
        let a = [12,14,19,14,15,12,123,1234,33]
        let num = 123
        for i in a {
            if i == num{
                return
            }
        }
    }
}
//二分查找 O(log n)
class binary_Search{

    func binary_search_method( array :[Int],num:Int){
        var a = array
        for _ in 0 ..< a.count {
            
            if a.count == 1{
                if a.first == num{
                    print("Search Done")
                    return
                }else{
                    print("None")
                    return
                }
            }else if a[a.count/2] < num{
                a.removeSubrange(0 ..< a.count/2)
                return binary_search_method(array: a, num: num)
            }else if a[a.count/2] > num{
                a.removeSubrange(a.count/2 ..< a.count)
                return binary_search_method(array: a, num: num)
            }
        }
    }
}
