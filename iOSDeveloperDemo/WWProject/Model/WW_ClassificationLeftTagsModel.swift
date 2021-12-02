//
//  WW_ClassificationLeftTagsModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/2.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit


struct WW_CategoryInfoItemModel : Codable{
    var code : String
    var displayName : String
    var smallImages : String
}

struct WW_CategoryInfoModel : Codable {
    var categoryInfo : [WW_CategoryInfoItemModel]
}

struct WW_TagsModel : Codable {
    var data : WW_CategoryInfoModel
    var code : Int
    var msg : String
}

