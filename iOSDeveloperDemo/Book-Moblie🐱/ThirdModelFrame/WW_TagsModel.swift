//
//  WW_TagsModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/5.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

struct categoryInfoItemModel : Codable{
    var code : String
    var displayName : String
    var smallImages : String
}
struct categoryInfoModel : Codable {
    var categoryInfo : [categoryInfoItemModel]
}

struct TagsModel : Codable {
    var data : categoryInfoModel
    var code : Int
    var msg : String
}

