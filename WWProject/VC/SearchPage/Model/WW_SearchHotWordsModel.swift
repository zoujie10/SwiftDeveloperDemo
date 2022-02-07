//
//  WW_SearchHotWordsModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/29.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchHotWordsItem : Codable{
    var name : String
    var isHighlight : String
    var code : String
    var isWholeSale : String
}

class WW_SearchHotWordsData : Codable{
    var keywords : [WW_SearchHotWordsItem]?
}

class WW_SearchHotWordsModel : Codable {
    var msg : String?
    var data : WW_SearchHotWordsData?
}
