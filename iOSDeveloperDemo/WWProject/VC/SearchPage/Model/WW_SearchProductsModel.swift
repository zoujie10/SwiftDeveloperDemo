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
    var retailPrice : String?
    var supplyPrice : String?
    var origPrice : String?
    var seckillPrice : String?
    var unit : String?
    var listImages : String?
    var ptKey : String?
    var displayName : String?
    var startSaleNum : String?
    var buyAddNum : String?
    var multiPtKeyNum : String?
    var productPictureLabelResponseList : [WW_ProductPictureLabelResponseList]?
    var actTags : [String]?
    var commodityBatchList : [WW_CommodityBatchList]?
}

class WW_SearchResultProductsData : Codable{
    var templateList : [WW_SearchProductsItem]?
    var total : String?
    var totalPage : String?
}

class WW_SearchProductsModel: Codable {
    var data : WW_SearchResultProductsData?
    var code : String?
    var msg : String?
}
/** 批次
 @property (nonatomic, copy) NSString *sku;

 /// 生产日期
 @property (nonatomic, copy) NSString *productionDate;

 /// 预计过期日期
 @property (nonatomic, copy) NSString *expireDate;

 /// 生产日期
 @property (nonatomic, copy) NSString *shelfLife;

 /// 口味
 @property (nonatomic, copy) NSString *flavour;

 /// 规格
 @property (nonatomic, copy) NSString *spec;

 /// 名称
 @property (nonatomic, copy) NSString *name;
 */
