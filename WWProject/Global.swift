//
//  Global.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/14.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

let WWScreenWidth = UIScreen.main.bounds.width
let WWScreenHeight = UIScreen.main.bounds.height

//iPhonex以上判断
let IS_IPhoneX_All = (WWScreenWidth == 812 || WWScreenHeight == 896)
//导航栏高
let WW_Device_NaviBar_Height = (IS_IPhoneX_All ? 88 : 64)
//状态栏高
let WW_Device_StatusBar_Height = (IS_IPhoneX_All ? 44 : 20)
//选项卡高
let WW_Device_TabBar_Height = (IS_IPhoneX_All ? 83 : 49)
//安全区高
let WW_Device_SafeArea_BottomHeight = (IS_IPhoneX_All ? 34 : 0)
