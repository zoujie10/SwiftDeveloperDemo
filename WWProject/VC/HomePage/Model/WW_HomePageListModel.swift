//
//  WW_HomePageListModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/13.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomeItemDetailIinkMode : Codable{
    var name : String?/// 跳转名称
    var type : String?/// 跳转类型
    var content : String?/// 跳转子类型或跳转所需参数
    var subset : String?/// 跳转所需参数
}

class WW_HomeItemDetailModel : Codable{
    var searchInterval : String?/// 搜索轮播间隔
    var tips : String?/// 搜索框提示文字
    var singleBackgroundURL : String?/// banner单个背景图
    var pictureURL : String?/// 其他图片地址
    var actPictureURL : String?/// 满赠左边小图
    var morePictureURL : String?/// 满赠右边小图
    var timeBackgroundColor : String?/// 满赠倒计时背景色
    var pictureWidth : String?///新人背景图宽度
    var pictureHeight : String?///新人背景图高度
    var pictureName : String?/// 其他图片名称
    var ptKey : String?/// 商品id
    var listImages : String?/// 商品图片地址
    var multiPtKeyNum : String?///是否单规格
//    var productPictureLabelResponseList : NSArray?///商品标签数组
    var discountPercentage : String?/// 商品折扣
    var name : String?/// 商品名称
    var desc : String?/// 商品描述
    var displayName : String?/// 商品规格
    var origPrice : String?/// 商品原价
    var retailPrice : String?/// 商品零售价
    var supplyPrice : String?/// 商品供货价
    var seckillPrice : String?/// 商品秒杀价
    var unit : String?/// 商品起售单位
    var actTags : [String]?//营销标签：BUY-满赠；GROUP-团购;seckill秒杀
    var startSaleNum : String?/// 最小销售数量
    var buyAddNum : String?/// 递增数量
    var normalLimitCount : String?/// 限购数量
    var isRecommend : Bool?/// 是否为推荐商品
    var linkPOP : WW_HomeItemDetailIinkMode?/// 其他跳转二级页数据
    var searchLinkPOP : WW_HomeItemDetailIinkMode?/// 搜索框跳转二级页数据
    var iconLinkPOP : WW_HomeItemDetailIinkMode?/// 搜索框右侧按钮跳转二级页数据
}

class WW_HomeItemModel : Codable{
    var asseName : String?/// 模块名称
    var asseType : Int?/// 模块类型
    var backgroundURL : String?/// banner/常购清单背景图
    var pictureURL : String?/// 秒杀背景图
    var actPictureURL : String?/// 秒杀左边小图
    var morePictureURL : String?/// 秒杀右边小图
    var timeBackgroundColor : String?/// 秒杀倒计时背景色
    var activityTime : String?/// 活动展示时间
    var startTime : String?/// 活动开始时间
    var currentTime : String?/// 服务器当前时间
    var endTime : String?/// 活动结束时间
    var state : Bool?/// 是否显示活动倒计时
    var carouselHeight : String?/// 轮播图高度
    var order : Int?/// 魔方编号 0: 魔方一 1: 魔方二
    var configureAttribute : [WW_HomeItemDetailModel]?/// 其他模块数据
    var configureAttributeList : [[WW_HomeItemDetailModel]]?/// 商品模块数据
}

class WW_HomePageListModel: Codable {
    var code : Int?
    var msg : String?
    var data : [WW_HomeItemModel]?
}
