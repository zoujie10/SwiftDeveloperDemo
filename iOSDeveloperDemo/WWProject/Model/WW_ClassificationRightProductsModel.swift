//
//  WW_ClassificationRightProductsModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/2.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

struct WW_CommodityBatchList : Codable{
    var shelfLife : String
    var flavour : String
    var name : String
    var skuRetailPrice : String
}

struct WW_ProductListInfoModel : Codable{
    var ceoStatus : String
    var channelId : String
    var key : String
    var name : String
    var smallImages : String
    var displayName : String
    var ptKey : String
    var retailPrice : String
    var listImages : String
    var commodityBatchList : WW_CommodityBatchList
    var unit : String
}

struct WW_ProductsInfoModel : Codable {
    var commodityInfo : [WW_ProductListInfoModel]
}

struct WW_ProductsListModel : Codable {
    var data : WW_ProductsInfoModel
    var code : Int
    var msg : String
}
/**
 {
     ceoStatus = 1;
     tagKey = <null>;
     channelId = S09033033001;
     key = 2463;
     description = ;
     name = 泡芙;
     template = {
     soldUnit = 罐;
     ptKey = 99036;
     areas = <null>;
     cKey = 2463;
     retailPrice = 17;
     startSaleNum = 1;
     description = <null>;
     isWholeSale = 0;
     sold = 7569;
     listImages = https://hotkidceo-1251330842.file.myqcloud.com/2021100814124000379.jpeg;
     unit = 组;
     multiSkuNum = 1;
     multiPtKeyNum = 1;
     isShow = <null>;
     name = 泡芙;
     isEs = <null>;
     inventory = 0;
     unitPrice = 17;
     discountPercentage = <null>;
     commodityBatchList = (
     {
     shelfLife = 30;
     volume = <null>;
     weight = <null>;
     sku = 300000000007;
     productionDate = 2021-09;
     expireDate = 2021-10;
     skuRetailPrice = 12;
     spec = 10.00g;
     flavour = 便甜;
     name = jn商品;
     skuBarcode = 300000000007;
 }
 */
