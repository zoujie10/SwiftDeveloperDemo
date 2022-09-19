//
//  GoodCode_Organization.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/9/17.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class GoodCode_Organization: NSObject {

}
/* MARK: 1 - Extension:使用extension组织代码

 使用extension将私有方法/父类方法/协议方法等不同功能代码进行分离更加清晰/易维护。

 class MyViewController: UIViewController {
   // class stuff here
 }
 //- Private
 extension: MyViewController {
	 private func method() {}
 }
 // - UITableViewDataSource
 extension MyViewController: UITableViewDataSource {
   // table view data source methods
 }
 //- UIScrollViewDelegate
 extension MyViewController: UIScrollViewDelegate {
   // scroll view delegate methods
 }
 */

/* MARK: 2 代码风格 - 考虑使用SwiftFormat和SwiftLint。
 
 良好的代码风格可以提高代码的可读性，统一的代码风格可以降低团队内相互理解成本。对于Swift的代码格式化建议使用自动格式化工具实现，将自动格式化添加到代码提交流程，通过定义Lint规则统一团队内代码风格。考虑使用SwiftFormat和SwiftLint。

 提示：SwiftFormat主要关注代码样式的格式化，SwiftLint可以使用autocorrect自动修复部分不规范的代码。
 常见的自动格式化修正

 移除多余的;
 最多只保留一行换行
 自动对齐空格
 限制每行的宽度自动换行
 
 */
