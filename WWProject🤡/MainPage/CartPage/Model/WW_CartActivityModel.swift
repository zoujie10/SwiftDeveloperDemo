//
//  WW_CartActivityModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/27.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartActivityModel: Codable {
    //活动id
    var activityId: Int?
    //isFull 0 部分 1 全场
    var isFull: Int?
    //活动类型 1 -随机  2-买家自选  3-指定送
    var way: Int?
    //赠品信息
    var subtotalTipsResponse: WW_CartActivityHeaderModel?
    // 0 普通商品 1 满赠活动商品 2 秒杀活动商品
    var type: Int?
    //是满赠和秒杀活动;
    var isGiftWithSkill:Bool?
}

class WW_CartActivityHeaderModel : Codable{
    //规则 1、满赠；2、每满赠
    var rule: Int?
    //1-未满 2-已满
    var flag: Int?
    //赠送件数
    var pieceNo: Int?
    //差额
    var marginAmount: Float?
    //满额
    var overAmount: Float?
    //
    var totalAmount: Float?
    //
    var giftAmount: Float?
    //赠品list
    var actBuyActivityProductList: [WW_CartComplimentaryModel]?
    //选中赠品list
    var checkedPtKeyList: [String]
    //阶梯所属位置  1:头部 2:中间阶梯 3:尾部阶梯
    var isMiddle: Int?
    //随机叠加 1.叠加 0 不叠加
    var randomAdd: Int?
}

class WW_CartComplimentaryModel : Codable{
    //规则id
    var ruleId: Int?
    //剩余数量
    var remainingCount: Int?
    //id
    var id: Int?
    //赠送顺序
    var sorting: Int?
    //key
    var ptKey: Int?
    //赠品数量
    var count: Int?
    //
    var updateTime: String?
    //删除
    var isDelete: Int?
    //图片
    var listImages: String?
    //每次赠送数量
    var everyCount: Int?
    //赠品可赠送数量
    var giftCount: Int?
    //是否选中
    var isSelect : Bool? = false
    //商品名称
    var name: String?
    //商品原始价格
    var origPrice: Float?
    //商品售卖价格
    var retailPrice: Float?
    //规格
    var displayName: String?
    //供货价
    var supplyPrice: Float?
    //是否选中当前的赠品 ,1选中  0未选中
    var isCheck: Int?
    //生产日期
    var productDate: String?
    //满赠叠加商品标识
    var repeatFlag: Int?
    //
    var selectedQuantity: Int?
}
