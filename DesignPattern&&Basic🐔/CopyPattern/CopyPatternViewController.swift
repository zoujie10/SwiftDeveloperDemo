//
//  CopyPatternViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2020/10/14.
//  Copyright © 2020 Zoujie. All rights reserved.
//

import UIKit
/*
我们都知道 Swift 有值类型和引用类型，而值类型在被赋值或被传递给函数时是会被拷贝的。在 Swift 中，所有的基本类型，包括整数、浮点数、字符串、数组和字典等都是值类型，并且都以结构体的形式实现

	使用 lldb 命令 fr v -R [object] 来查看对象内存结构
*/
class CopyPatternViewController: UIViewController {
	let strCopy = "copyStr"
	var str_Copy_2 = "copy"
	var arrayCopy = Array<Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.orange
		//浅拷贝 对象地址相同 深拷贝 创建新地址
        var strCopy_1 = strCopy
//		str_Copy_2 = strCopy
		print(strCopy_1,str_Copy_2,strCopy)
		
		strCopy_1 = "temp"
		str_Copy_2 = "copy_2"
		print(strCopy_1,str_Copy_2,strCopy)
		
		arrayCopy = ["1","2","3"]
		let arrayCopy_1 = arrayCopy
		var arrayCopy_2 = arrayCopy
		print(arrayCopy_1,arrayCopy_2,arrayCopy)
		
		arrayCopy_2[1] = "999"
		print(arrayCopy_1,arrayCopy_2,arrayCopy)
    }

}
