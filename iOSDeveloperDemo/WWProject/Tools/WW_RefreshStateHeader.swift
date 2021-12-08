//
//  WW_RefreshStateHeader.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/8.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import MJRefresh

class WW_RefreshStateHeader: MJRefreshStateHeader {

    lazy var gifView : UIImageView = {
        let gifView = UIImageView()
        return gifView
    }()
    
    var stateImage = NSMutableDictionary()
    var stateDurations = NSMutableDictionary()
        
}
