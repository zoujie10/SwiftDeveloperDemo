//
//  WW_RefreshAutoGifFooter.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/8.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import MJRefresh

class WW_RefreshAutoGifFooter: MJRefreshBackGifFooter {
    override func prepare() {
        super.prepare()
        self.gifView?.image = UIImage(named: "ww_classifys_pullup_updata_arrow")
    }
    //重写set方法
//    var stateTemp : MJRefreshState = .idle
//
//    override var state: MJRefreshState {
//        set(state){
//            if (state == .refreshing){
//
//            }else if (state == .noMoreData){
//
//            }else if (state == .idle){
//                self.gifView?.isHidden = false
//            }
//            self.stateTemp = state
//        }
//        get{
//            return self.stateTemp
//        }
//    }
    
    func configFooterRefreshContext(title : String){
        self.setTitle(title, for: .idle)
        self.setTitle(title, for: .pulling)
        self.setTitle(title, for: .refreshing)
//        self.placeSubviews()
    }
    
    
}
