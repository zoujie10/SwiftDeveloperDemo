//
//  MyNetWorkReachabilityManager.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/4.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import Alamofire
class MyNetWorkReachabilityManager {
    private static let sharedInstance = MyNetWorkReachabilityManager()
    var manager = NetworkReachabilityManager.init()
    
    init() {
        manager?.listener = {status in
            print("NetWork status Changed:\(status)")
        }
        manager?.startListening()
    }
    
    class var  shareManager : MyNetWorkReachabilityManager{
        let instance = self.sharedInstance
        return instance
    }
    
    func netWorkReachabilityStatus() ->Alamofire.NetworkReachabilityManager.NetworkReachabilityStatus{
        let status : Alamofire.NetworkReachabilityManager.NetworkReachabilityStatus = (manager?.networkReachabilityStatus)!
        debugPrint("当前网络状态哦\(status)")
        return status
    }
}
