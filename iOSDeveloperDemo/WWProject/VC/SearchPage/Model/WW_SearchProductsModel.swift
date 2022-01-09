//
//  WW_SearchProductsModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/6.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit


class WW_ProductPictureLabelResponseList : Codable{
    
}

class WW_SearchProductsItem : Codable {
    var name : String?
    var spec : String?
    var Description : String?
    @WW_dataTransString var retailPrice : String?
    @WW_dataTransString var supplyPrice : String?
    @WW_dataTransString var origPrice : String?
    @WW_dataTransString var seckillPrice : String?
    var unit : String?
    var listImages : String?
    @WW_dataTransString var ptKey : String?
    var displayName : String?
    @WW_dataTransString var startSaleNum : String?
    @WW_dataTransString var buyAddNum : String?
    @WW_dataTransString var multiPtKeyNum : String?
    @WW_dataTransString var sold : String?
    var productPictureLabelResponseList : [WW_ProductPictureLabelResponseList]?
    var actTags : [String]?
    var commodityBatchList : [WW_CommodityBatchList]?
}

class WW_SearchResultProductsData : Codable{
    var templateList : [WW_SearchProductsItem]?
    //搜索结果
    var total : Int?
    var totalPage : Int?
    //猜你喜欢
    var pageCount : Int?
    var totalCount : Int?
}

class WW_SearchProductsModel: Codable {
    var data : WW_SearchResultProductsData?
    var code : Int?
    var msg : String?
}

