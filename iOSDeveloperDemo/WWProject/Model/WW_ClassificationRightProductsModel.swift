//
//  WW_ClassificationRightProductsModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/2.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

struct WW_CommodityBatchList : Codable{
    var shelfLife : String?
    var flavour : String?
    var name : String?
    var skuRetailPrice : Float?
}

struct WW_ProducttemplateMolde : Codable{
    var name : String?
    var actTags : [String]?
    var listImages : String?
    var retailPrice : Float?
    @WW_dataTransString var origPrice : String?
    var supplyPrice : Float?
    var startSaleNum : Int?
    var unit : String?
    var displayName : String?
    var commodityBatchList : [WW_CommodityBatchList]?
}
struct WW_ProductListInfoModel : Codable{
    var ceoStatus : Int?
    var channelId : String?
    var key : Int?
    var name : String?
    var template : WW_ProducttemplateMolde
}
struct WW_ProductInfoItemModel : Codable{
    var bannerImages : String?
    var displayName : String?
    var backgroundColor : String?
}

struct WW_ProductsInfoModel : Codable {
    var commodityInfo : [WW_ProductListInfoModel]?
    var categoryInfo : WW_ProductInfoItemModel?
    var pageCount : Int?
}

struct WW_ProductsListModel : Codable {
    let data : WW_ProductsInfoModel?
    var code : Int?
    var msg : String?
}


//兼容 返回后台更改参数类型后 不匹配
//Codable自定义解析将任意数据类型解析为想要的类型
@propertyWrapper public struct WW_dataTransString : Codable{
    public var wrappedValue : String?
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        var string : String?
        do {
            string = try container.decode(String.self)
        }catch{
            do {
                string = String(try container.decode(Int.self))
            }catch{
                do {
                   string = String(try container.decode(Double.self))
                }catch{
                        //如果不想要String？ 可以在此处赋值 string = ""
                    string = nil
                }
            }
        }
        wrappedValue = string
    }
}
