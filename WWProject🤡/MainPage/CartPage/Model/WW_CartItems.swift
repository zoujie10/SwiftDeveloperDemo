//
//  WW_CartItems.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/5.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import Foundation

class WW_CommodityBatch:Codable{
    var sku: String?
    var productionDate: String?
    var expireDate: String?
    var shelfLife: String?
    var flavour: String?
    var name: String?
}
class WW_ProductTemplate:Codable{
    //商品规格名称
    var displayName: String?
    //商品图片
    var list_images: String?
    //
    var status: Int?
    //商品真实价格
    var retailPrice: Float?
    //商品供货价格
    var supplyPrice: Float?
    //商品原始价格
    var origPrice: Float?
    //商品名称
    var name: String?
    //商品库存
    var inventory: Int?
}

class WW_CartItem:Codable{
    //单个商品
    var wpProductTemplate: WW_ProductTemplate?
    //商品的数量
    var quantity: Int?
    //商品的折扣
    var discountPercentage: Float?
    //商品的类型  1 零售  2箱购
    var orderType: String?
    //商品的key
    var productTemplateKey: Int?
    //商品的是否选中  1 选中  0 不选中
    var isSelect : Int?
    //删除商品的是否选中  1 选中  0 不选中
    var isDeleteSelect : Int?
    //活动id
    var activityId: Int?
    //商品参加活动的次数
    var ptKeyActCount: Int?
    //秒杀活动id
    var seckillActivityId: Int?
    //是否是秒杀商品
    var isSeckill : Int
    //活动秒杀价格
    var seckillPrice: Float?
    //即将上涨秒杀价格
    var increasePrice: Float?
    //秒杀商品剩余库存
    var buyCount: Int?
    //是否限购
    var isLimit: Int?
    //限购数量
    var limitCount: Int?
    //活动状态  1 未开始  2 进行中 3 已结束
    var status: Int?
    //秒杀活动开始时间
    var endTime: String?
    //当前时间时间
    var currentTime: String?
    //原始价格
    var originalPrice: Float?
    //积分分摊金额
    var discountPointAmount: Float?
    //优惠券分摊金额
    var discountVoucherAmount: Float?
    //优惠分摊金额
    var singularDiscountAmount: Float?
    //批次信息
    var commodityBatchList: [WW_CommodityBatch]?
    /// 最小销售数量
    var startSaleNum: Int?
    /// 递增数量
    var buyAddNum: Int?
    /// 限购
    var normalLimitCount: Int?
    /// 单位
    var unit: String?
    /// 最小单位
    var soldUnit: String?
    // 销售数量是否需要遵守低则规则 （自定义字段）
    var orderSpecRule : Int?
    // 叠加活动商品
    var repeatFlag: Int?
    //是否是新人商品
    var isOnlyNewMember: Int?
    //自定义属性  是否可以删除
    var isCanDelete : Bool?
}
//
class WW_ComplimentaryModel:Codable{
    //规则id
    var ruleId: String?
    //剩余数量
    var remainingCount: String?
    //id
    var anId: String?
    //赠送顺序
    var sorting: String?
    //key
    var ptKey: String?
    //赠品数量
    var count: String?
    //
    var updateTime: String?
    //删除
    var isDelete: String?
    //图片
    var listImages: String?
    //每次赠送数量
    var everyCount: String?
    //赠品可赠送数量
    var giftCount: String?
    //赠品已选数量
    var selectedQuantity: String?
    //是否选中
    var isSelect = false
    //商品名称
    var name: String?
    //商品原始价格
    var origPrice: String?
    //商品售卖价格
    var retailPrice: String?
    //规格
    var displayName: String?
    //供货价
    var supplyPrice: String?
    //是否选中当前的赠品 ,1选中  0未选中
    var isCheck: String?
    //生产日期
    var productDate: String?
    //满赠叠加商品标识
    var repeatFlag: String?
}

class WW_ActivityHeaderModel : Codable{
    //规则 1、满赠；2、每满赠
    var rule : String?
    //1-未满 2-已满
    var flag : String?
    //赠送件数
    var pieceNo : String?
    //差额
    var marginAmount: String?
    //满额
    var overAmount: String?
    //已购金额
    var totalAmount: String?
    //可选择赠品总金额
    var giftAmount: String?
    //赠品list
    var actBuyActivityProductList: [WW_ComplimentaryModel]
    //选中赠品list
//    var checkedPtKeyList: [AnyHashable]?
    //阶梯所属位置  1:头部 2:中间阶梯 3:尾部阶梯
    var isMiddle: String?
    //随机叠加 1.叠加 0 不叠加
    var randomAdd: String?
}
class WW_CartDiscountInfo:Codable{
    //优惠后的总价
    var grandTotal: Float?
    //共使用价格
    var pointDeductionRmbAmount: Float?
    //共使用优惠券
    var couponDiscountAmount: Float?
    //优惠券是否未领标示（-1未领取；0领取）
    var usedCouponStatus: Int?
    //优惠券code
    var couponCode: String?
    //积分数量
    var pointAmount: Float?
    /// 购物车商品总金额
    var cartAllAmount: Float?
    /// 满减
    var fullReductionAmount: Float?
}
class WW_RepeatFalg:Codable{
//    var repeatActList : []
//    var repeatCartItemList : []
}
//floor 3
class WW_ActivityModel : Codable{
    //活动id
    var activityId:Int?
    //isFull
    var isFull:String?
    //活动类型 1 -随机  2-买家自选  3-指定送
    var way:String?
    //赠品信息
    var subtotalTipsResponse : WW_ActivityHeaderModel?
    //参加活动的购物车商品
    var cartItemList:[WW_CartItem]
    // 0 普通商品 1 满赠活动商品 2 秒杀活动商品
    var type:Int?
    //是满赠和秒杀活动;
    var isGiftWithSkill:Bool?
}
//floor 2
class WW_CartItems :Codable{
    var configId:String?
    //有效商品列表
    var valid : [WW_ActivityModel]
    //失效商品列表
    var invalid : [WW_ActivityModel]
    //优惠信息
    var wpCartDiscountInfo:WW_CartDiscountInfo?
    //叠加活动信息
    var repeatFlag:WW_RepeatFalg?
    //小标是否选择赠品弹窗
    var popupFlag:Bool?
    //弹窗文案
    var popupDoc:String?
    //满赠池活动id
    var actBuyPoolId:String?
}
//floor 1
class WW_CartItemsData : Codable{
    var msg : String?
    var code : Int?
    var data : WW_CartItems?
}
