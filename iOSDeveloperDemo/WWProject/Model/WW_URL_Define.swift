//
//  WW_URL_Define.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/2.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
#if DEBUG
let WW_BaseURL = "http://dev-api.hotkidceo.com/"
#endif
#if RELEASE
let WW_BaseURL = "http://static.hotkidceo.com/"
#endif

//MARK:POST
//分类
let WW_CategoryTagList_Url =  "appapi/root-ceo-commodity/categoryApi/categoryList"
let WW_CategoryProductsList_Url = "appapi/root-ceo-commodity/categoryApi/commoditiesByCategory"

//MARK:GET
let WW_showChart_Get_Url = "http://dev-api.hotkidceo.com/ceo/order/showChart"

//MARK:UPLoad
let WW_uploadImage_Url = "http://dev-api.hotkidceo.com/ceo/order/service/uploadImage"

//举报
let WW_kBDInformPricereportUpImages = "appapi/root-ceo-commodity/commonApi/uploadFiles" //上传举报图片
let WW_kBDInformSubmitPricereport   = "appapi/root-ceo-commodity/reportApi/submitPriceReport" //提交价格举报
let WW_kBDInformPriceUnreadMessage = "appapi/root-ceo-commodity/reportApi/reportReminder" // 价格举报未读消息
let WW_kBDInformPriceOrderList  = "appapi/root-ceo-commodity/reportApi/queryReport" //举报列表
let WW_kBDInformOrderDetail     = "appapi/root-ceo-commodity/reportApi/queryReportById" //举报详情
