//
//  WW_HomeItemDetailLinkViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/16.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
enum WW_HomeItemType : Int{
    case WW_HomeItemTypeNone          = 0    // 默认
    case WW_HomeItemTypeSearch        = 1    // 搜索框
    case WW_HomeItemTypeBanner        = 2    // 轮播图
    case WW_HomeItemTypeChannelFirst  = 3   // 频道导航（5个）(废弃)
    case WW_HomeItemTypeChannelSecond = 4   // 频道导航（5个）(废弃)
    case WW_HomeItemTypeChannelThird  = 5   // 频道导航（5个）(废弃)
    case WW_HomeItemTypeActivity      = 6   // 大转盘
    case WW_HomeItemTypeCouponFirst   = 7  // 优惠券（2宫格）
    case WW_HomeItemTypeCouponSecond  = 8    // 优惠券（3宫格）
    case WW_HomeItemTypeCouponThird   = 9    // 优惠券（4宫格）
    case WW_HomeItemTypeNotify        = 10   // 公告
    case WW_HomeItemTypeMagicFirst    = 11  // 魔方（2宫格）
    case WW_HomeItemTypeMagicSecond   = 12  // 魔方（3宫格）
    case WW_HomeItemTypeMagicThird    = 13  // 魔方（4宫格）
    case WW_HomeItemTypeGoods         = 14  // 商品列表
    case WW_HomeItemTypeLike          = 15  // 为你推荐（标题）
    case WW_HomeItemTypeLife          = 16  // 为你推荐（结束语）
    case WW_HomeItemTypeChannel       = 17   // 频道导航
    case WW_HomeItemTypeGift          = 18   // 限时满赠
    case WW_HomeItemTypeKill          = 19  // 限时秒杀
    case WW_HomeItemTypeNewUser       = 20   // 新人专区
    case WW_HomeItemTypeGoodsList     = 21   // 常购清单
    // 22被安卓占用
    case WW_HomeItemTypeChannelNew    = 23    // 频道导航（Z型）
}
class WW_HomeItemDetailLinkViewModel: NSObject {

}
