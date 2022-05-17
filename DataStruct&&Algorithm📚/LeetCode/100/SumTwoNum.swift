//
//  SumTwoNum.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/15.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
/**
 1.给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。
 */
class SumTwoNum: NSObject {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var num1 : Int = 0
        var num2 : Int = 0
        for i in 0 ..< nums.count {
            for j in 1 ..< nums.count{
                if nums[i] + nums[j] == target && i != j {
                    num1 = i
                    num2 = j
                    return [i,j]
                }
            }
        }
        return [num1,num2]
    }
}

/**
 2. 两数相加
 给你两个 非空的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 */
class Solution{
    //array
    func addTwoNumbers(_ l1: [Int], _ l2: [Int]) -> [Int] {
        var returnArray = [Int]()
        let maxIndex = l1.count > l2.count ? l1.count : l2.count

        var addNum = 0
        for i in 0 ..< maxIndex{
            var sum = 0
            if i < l2.count{
                sum = l1[i]+l2[i]
            }else{
                sum = l1[i]
              
            }
            if sum >= 10{
                sum = sum%10
                if addNum == 1{
                    sum = sum+addNum
                }
                addNum = 1
               
            }else{
                if addNum == 1{
                    sum = sum+addNum
                }
                if sum == 10{
                    sum = 0
                    addNum = 1
                }else{
                    addNum = 0
                }
            }
            returnArray.append(sum)
        }
        if addNum == 1{
            returnArray.append(addNum)
        }
        return returnArray
    }
    //Node TODO
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
}
