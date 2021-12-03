//
//  WW_ClassificationRightProductsModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/2.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
//TODO：兼容 返回后台更改参数类型后 不匹配
struct WW_CommodityBatchList : Codable{
    var shelfLife : String
    var flavour : String
    var name : String
    var skuRetailPrice : Float
}

struct WW_ProducttemplateMolde : Codable{
    var name : String
    var actTags : [String]
    var listImages : String
    var retailPrice : Float
    var origPrice : Float
    var supplyPrice : Float
    var startSaleNum : Int
    var unit : String
    var displayName : String
    var commodityBatchList : [WW_CommodityBatchList]
}
struct WW_ProductListInfoModel : Codable{
    var ceoStatus : Int
    var channelId : String
    var key : Int
    var name : String
    var template : WW_ProducttemplateMolde
}
struct WW_ProductInfoItemModel : Codable{
    var bannerImages : String
    var displayName : String
    var backgroundColor : String
}

struct WW_ProductsInfoModel : Codable {
    var commodityInfo : [WW_ProductListInfoModel]
    var categoryInfo : WW_ProductInfoItemModel
    var pageCount : Int
}

struct WW_ProductsListModel : Codable {
    let data : WW_ProductsInfoModel?
    var code : Int
    var msg : String
}
