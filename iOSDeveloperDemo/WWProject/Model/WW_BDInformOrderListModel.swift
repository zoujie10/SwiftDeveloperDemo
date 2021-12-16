//
//  WW_BDInformOrderListModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/14.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

struct WWBDInformItem : Codable{
    @WW_dataTransString var id : String?
    var commodityName : String?
    var productName : String?
    var ptKey : Int?
    @WW_dataTransString var retailPrice : String?
    @WW_dataTransString var supplyPrice : String?
    @WW_dataTransString var reportPrice : String?
    var unit : String?
    var reportSource : String?
    var memberKey : Int?
    var reporterNumber : String?
    var reporterArea : String?
    var reporterCompany : String?
    var reporterOffice : String?
    @WW_dataTransString var status : String?
    var createdTime : String?
    var `operator` : String?
    var reportResult : String?
    var listImages : String?
}

struct WWBDInformData : Codable{
    var total : Int?
    var records : [WWBDInformItem]?
}

struct WW_BDInformOrderListModel: Codable {
    var msg : String?
    var code : Int?
    var data : WWBDInformData?
}
