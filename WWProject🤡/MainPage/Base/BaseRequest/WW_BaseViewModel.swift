//
//  WW_BaseViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/25.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_BaseViewModel: NSObject {
    typealias Success_Block = () -> Void
    var success_block : Success_Block?
    typealias Failure_Block = (String) -> Void
    var failure_block : Failure_Block?
}
