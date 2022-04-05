//
//  WW_CartItems.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/5.
//  Copyright © 2022 Zoujie. All rights reserved.
//

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
    //商品图片
    var status: String?
    //商品真实价格
    var retailPrice: String?
    //商品供货价格
    var supplyPrice: String?
    //商品原始价格
    var origPrice: String?
    //商品名称
    var name: String?
    //商品库存
    var inventory: String?
}

class WW_CartItem:Codable{
    //单个商品
    var wpProductTemplate: WW_ProductTemplate?
    //商品的数量
    var quantity: String?
    //商品的折扣
    var discountPercentage: String?
    //商品的类型  1 零售  2箱购
    var orderType: String?
    //商品的key
    var productTemplateKey: String?
    //商品的是否选中  1 选中  0 不选中
    var isSelect = false
    //删除商品的是否选中  1 选中  0 不选中
    var isDeleteSelect = false
    //活动id
    var activityId: String?
    //商品参加活动的次数
    var ptKeyActCount: String?
    //秒杀活动id
    var seckillActivityId: String?
    //是否是秒杀商品
    var isSeckill = false
    //活动秒杀价格
    var seckillPrice: String?
    //即将上涨秒杀价格
    var increasePrice: String?
    //秒杀商品剩余库存
    var buyCount: String?
    //是否限购
    var isLimit: String?
    //限购数量
    var limitCount: String?
    //活动状态  1 未开始  2 进行中 3 已结束
    var status: String?
    //秒杀活动开始时间
    var endTime: String?
    //当前时间时间
    var currentTime: String?
    //原始价格
    var originalPrice: String?
    //积分分摊金额
    var discountPointAmount: String?
    //优惠券分摊金额
    var discountVoucherAmount: String?
    //优惠分摊金额
    var singularDiscountAmount: String?
    //批次信息
    var commodityBatchList: [WW_CommodityBatch]?
    /// 最小销售数量
    var startSaleNum: String?
    /// 递增数量
    var buyAddNum: String?
    /// 限购
    var normalLimitCount: String?
    /// 单位
    var unit: String?
    /// 最小单位
    var soldUnit: String?
    // 销售数量是否需要遵守低则规则 （自定义字段）
    var orderSpecRule = false
    // 叠加活动商品
    var repeatFlag: String?
    //是否是新人商品
    var isOnlyNewMember: String?
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
class WW_ActivityHeaderModel:Codable{
    //规则 1、满赠；2、每满赠
    var rule: String?
    //1-未满 2-已满
    var flag: String?
    //赠送件数
    var pieceNo: String?
    //差额
    var marginAmount: String?
    //满额
    var overAmount: String?
    //已购金额
    var totalAmount: String?
    //可选择赠品总金额
    var giftAmount: String?
    //赠品list
    var actBuyActivityProductList: [WW_ComplimentaryModel]?
    //选中赠品list
    var checkedPtKeyList: [AnyHashable]?
    //阶梯所属位置  1:头部 2:中间阶梯 3:尾部阶梯
    var isMiddle: String?
    //随机叠加 1.叠加 0 不叠加
    var randomAdd: String?
}
class WW_CartDiscountInfo:Codable{
    
}
class WW_RepeatFalg:Codable{
    
}
//floor 3
class WW_ActivityModel : Codable{
    //活动id
    var activityId;
    //isFull
    var isFull;
    //活动类型 1 -随机  2-买家自选  3-指定送
    var way;
    //赠品信息
    var subtotalTipsResponse:WW_ActivityHeaderModel;
    //参加活动的购物车商品
    var cartItemList:[WW_CartItem]
    // 0 普通商品 1 满赠活动商品 2 秒杀活动商品
    var type:String?
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
    var  wpCartDiscountInfo:WW_CartDiscountInfo
    //叠加活动信息
    var  repeatFlag:WW_RepeatFalg?
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
