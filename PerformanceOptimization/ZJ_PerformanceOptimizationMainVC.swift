//
//  ZJ_PerformanceOptimizationMainVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/23.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class ZJ_PerformanceOptimizationMainVC: WW_MainBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

/* MARK: 1 性能优化 性能优化上主要关注提高运行时性能和降低二进制体积。需要考虑如何更好的使用Swift特性，同时提供更多信息给编译器进行优化。
 */
 /* MARK: 2 使用Whole Module Optimization

 当Xcode开启WMO优化时，编译器可以将整个程序编译为一个文件进行更多的优化。例如通过推断final/函数内联/泛型特化更多使用静态派发，并且可以移除部分未使用的代码。
  */
  /* MARK: 3 使用源代码打包

 当我们使用组件化时，为了提高编译速度和打包效率，通常单个组件独立编译生成静态库，最后多个组件直接使用静态库进行打包。这种场景下WMO仅针对internal以内作用域生效，对于public/open缺少外部使用信息所以无法进行优化。所以对于大量使用Swift的项目，使用全量代码打包更有利于编译器做更多优化。
   */

/* MARK: 4 减少方法动态派发

 使用final - class/方法/属性申明为final，编译器可以优化为静态派发
 使用private - 方法/属性申明为private，编译器可以优化为静态派发
 避免使用dynamic - dynamic会使方法通过ObjC消息转发的方式派发
 使用WMO - 编译器可以自动分析推断出final优化为静态派发
 */

/* MARK: 5 使用Slice共享内存优化性能

 在使用Array/String时，可以使用Slice切片获取一部分数据。Slice保存对原始Array/String的引用共享内存数据，不需要重新分配空间进行存储。

 let midpoint = absences.count / 2

 let firstHalf = absences[..<midpoint]
 let secondHalf = absences[midpoint...]
 // firstHalf/secondHalf并不会复制和占用更多内存

 提示：应避免一直持有Slice，Slice会延长原始Array/String的生命周期导致无法被释放造成内存泄漏。
 */
