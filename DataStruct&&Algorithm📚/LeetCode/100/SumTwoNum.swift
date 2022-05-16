//
//  SumTwoNum.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/15.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
/**
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

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
