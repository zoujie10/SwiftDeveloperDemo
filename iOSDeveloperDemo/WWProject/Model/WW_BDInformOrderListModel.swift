//
//  WW_BDInformOrderListModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/14.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

struct WWBDInformItem : Codable{
    var id : Double?
    var commodityName : String?
    var productName : String?
    var retailPrice : Double?
    var supplyPrice : Double?
    var reportPrice : Double?
    var unit : String?
    var reportSource : String?
    var status : Double?
    var createdTime : String?
    var reportResult : String?
}

struct WWBDInformData : Codable{
    var total : NSInteger?
    var records : [WWBDInformItem]?
}

struct WW_BDInformOrderListModel: Codable {
    var msg : String?
    var code : String?
    var data : WWBDInformData?
}
