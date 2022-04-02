//
//  WW_ComplexOrderListModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/31.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_ComplexOrderSingleProductItem : Codable{
    var ceoKey:Int?
    var ceoStoreName:String?
    var productTemplateCode:String?
    var itemImageNames:String?
    var name:String?
    var shortName:String?
    var quantity:Int?
    
    @WW_dataTransString var subTotal:String?
    var commission:Float?
    // 实际下单价格
    @WW_dataTransString var orderItemPrice:String?
    @WW_dataTransString var retailPrice:String?
    @WW_dataTransString var supplyPrice:String?
    @WW_dataTransString var origPrice:String?
    var imageNames:String?
    // 规格
    var displayName:String?
    // 替代之前的 displayName
    var productTemplateName:String?
    var discountPercentage:Float?
    var discountVoucherAmount:Float?
    var isServiced:String?
    var isUsedvoucher:Int?
    // 商品key 替代之前的 sku
    var productTemplateKey:String?
    // 退换货新增
    var weight:Int?
    var refundStatus:String?
    var serviceHeaderKey:String?
    // 普通商品：0，赠品或奖品：1，秒杀商品：2
    var isGiveaway:Int?
    // 随机：0，其他：1（该字段有值就是赠品，无值就是奖品）
    var isOptional:Int?
    // 满赠活动id
    var activityProductKey:Int?
    //活动id
    var actId:Int?
    // 售后申请数量
    var saleApplyCount:Int?
    //1 无售后 2 售后中 3 售后成功 4 部分售后成功 5 售后关闭
    var itemSaleAfterStatus:Int?
    var key:Int?
}

class WW_ComplexOrderSingleOrderData : Codable{
    var code : String?
    var itemCount : Int?
    var itemQuantity : Int?
    var grandTotal : Float?
    var itemsTotal : Float?
    var placedAt : String?//下单时间  "placedAt": "2022-04-1 23:31:45",
    ///判断是否倒计时
    var isTimers:String?
    ///倒计时秒数
    var time:String?//30分钟超时
    var processingAt : String?
    var status : String?
    var source : String?
    var servicedStatus : String?
    var rmbTransactionStatus : String?
    var wbTransactionStatus : String?
    var rmbTransactionAmount : Float?
    var wbTransactionAmount : String?
    var deliveryFee : Int?
    var discountAmount : String?
    var updatedAt : String?
    var receiverName : String?
    var receiverMobileNumber : String?
    var ceoStoreName : String?
    var receiverProvince : String?
    var receiverCity : String?
    var receiverDistrict : String?
    var receiverStreet : String?
    var eceiverStreet:String?
    var placedMobileNumber:String?
    var invoiceTitle:String?
    var noteMember:String?
    ///item奖励金额
    var commission:String?
    ///奖励金额合计
    var ceoCommission:Float?
    var paid:Bool?
    ///0：未确认收货 显示按钮  1：确认收货 不显示按钮
    var isManualReceived:Int?
    ///确认收货奖励金金额
    var manualreceivecommissionamount:Float?
    var method:String?
    var requestedAt:String?
    var orderType:Int?
    var channel:String?
    var addressCode:String?
    var addressTag:String?
    var couponCode:String?
    var couponDiscountAmount:Float?
    var couponDiscountDescription:String?
    var freeDescription:String?
    var freeProductSku:String?
    var invoiceCode:String?
    var isDelete:Int?
    var type:Int?
    var origTotal:String?
    var accountId:String?
    var orderHeaderKey:String?
    ///使用积分抵扣RMB金额
    var pointDeductionRmbAmount:Float?
    var items : [WW_ComplexOrderSingleProductItem]
}
class WW_ComplexOrderListCount : Codable{
    var pageCount : Int?
    var recordCount : Int?
}

class WW_ComplexOrderListData : Codable {
    var orderLst : [WW_ComplexOrderSingleOrderData]
    var lstStats : WW_ComplexOrderListCount
}


class WW_ComplexOrderListModel: Codable {
    var msg : String?
    var code : Int?
    var data : WW_ComplexOrderListData?
}

/**
 {
     "code": 0,
     "msg": "cc_operate_success",
     "message": "cc_operate_success",
     "data": {
         "orderLst": [{
             "code": "2203302331700001",
             "source": "CEO",
             "channelId": "S09033033001",
             "channel": "IOS",
             "orderType": 2,
             "isPoint": 0,
             "shareMode": 0,
             "type": 3,
             "status": "CANCEL",
             "placedAt": "2022-03-30 23:31:45",
             "cancelAt": "2022-03-30 23:32:06",
             "ceokey": 17721815,
             "rmbTransactionAmount": 50.00,
             "rmbTransactionStatus": "NONE",
             "rmbTransactions": [],
             "wbTransactionStatus": "NONE",
             "wbTransactions": [],
             "weightTotal": 5850,
             "deliveryFee": 0.00,
             "itemsTotal": 50.00,
             "cardPaidAmount": 0.00,
             "rmbGrandTotal": 50.00,
             "couponCode": "",
             "grandTotal": 50.00,
             "itemCount": 8,
             "itemQuantity": 30,
             "addressCode": "4de70a78-67fb-475d-9e90-e150968be6b6",
             "addressTag": "OTHERS",
             "receiverProvince": "江苏省",
             "receiverCity": "南京市",
             "receiverDistrict": "玄武区",
             "receiverStreet": "12312",
             "receiverName": "123",
             "receiverGender": 1,
             "receiverMobileNumber": "18711111111",
             "invoiceCode": "",
             "isInvoice": 0,
             "noteMember": "",
             "cancelReason": "21",
             "isSmall": 0,
             "deliverys": [],
             "items": [{
                 "key": 3873594,
                 "productTemplateCode": "99040",
                 "supplyPrice": 13.00,
                 "name": "克勤库存测试004",
                 "weight": 598,
                 "retailPrice": 32.00,
                 "origPrice": 32.00,
                 "discountPercentage": 10.00,
                 "quantity": 1,
                 "subTotal": 13.00,
                 "itemImageNames": "https://hotkidceo-1251330842.file.myqcloud.com/2021100814034600367.jpeg",
                 "isServiced": "0",
                 "commission": 0.00,
                 "ceoKey": 17721815,
                 "orderHeaderKey": 2203302331700001,
                 "productTemplateName": "QQ糖",
                 "orderItemPrice": 13.00,
                 "isUsedvoucher": 0,
                 "isGiveaway": 0,
                 "activityProductKey": 942,
                 "discountVoucherAmount": 0.00,
                 "discountFullAmount": 0,
                 "specRetailSubtotal": 13.00,
                 "specRetailPayPrice": 0,
                 "unit": "组",
                 "saleApplyCount": 1,
                 "seckillPrice": 13.00,
                 "itemSaleAfterStatus": 1,
                 "commodityBatchList": [{
                     "sku": null,
                     "productionDate": "2021-06",
                     "expireDate": null,
                     "shelfLife": null,
                     "flavour": null,
                     "spec": null,
                     "name": null,
                     "ptInventory": null
                 }],
                 "fullReductionId": 0,
                 "actTag": 3,
                 "itemTotalDiscountProductSpec": 0,
                 "saleUnit": "组",
                 "specRmbRetailSubtotal": 13.00,
                 "areaSupplyPrice": 0,
                 "companySupplyPrice": 0,
                 "partnerSupplyPrice": 0,
                 "giftPoolFlag": 0,
                 "specRetailSubtotalByFull": 0,
                 "specRetailPayPriceByFull": 0
             }, {
                 "key": 3873595,
                 "productTemplateCode": "99042",
                 "supplyPrice": 4.90,
                 "name": "KQ-小标商品001",
                 "weight": 1900,
                 "retailPrice": 6.80,
                 "origPrice": 6.80,
                 "discountPercentage": 10.00,
                 "quantity": 2,
                 "subTotal": 9.80,
                 "itemImageNames": "https://hotkidceo-1251330842.file.myqcloud.com/2021092614513400097.jpeg",
                 "isServiced": "0",
                 "commission": 0.00,
                 "ceoKey": 17721815,
                 "orderHeaderKey": 2203302331700001,
                 "productTemplateName": "甜甜圈草莓味",
                 "orderItemPrice": 4.90,
                 "isUsedvoucher": 0,
                 "isGiveaway": 0,
                 "activityProductKey": 942,
                 "discountVoucherAmount": 0.00,
                 "discountFullAmount": 0,
                 "specRetailSubtotal": 9.80,
                 "specRetailPayPrice": 0,
                 "unit": "组",
                 "saleApplyCount": 2,
                 "seckillPrice": 4.90,
                 "itemSaleAfterStatus": 1,
                 "commodityBatchList": [{
                     "sku": null,
                     "productionDate": "2021-09",
                     "expireDate": null,
                     "shelfLife": null,
                     "flavour": null,
                     "spec": null,
                     "name": null,
                     "ptInventory": null
                 }],
                 "fullReductionId": 0,
                 "actTag": 3,
                 "itemTotalDiscountProductSpec": 0,
                 "saleUnit": "组",
                 "specRmbRetailSubtotal": 9.80,
                 "areaSupplyPrice": 0,
                 "companySupplyPrice": 0,
                 "partnerSupplyPrice": 0,
                 "giftPoolFlag": 0,
                 "specRetailSubtotalByFull": 0,
                 "specRetailPayPriceByFull": 0
             },
         }],
         "lstStats": {
             "pageCount": 16,
             "recordCount": 181
         }
     },
     "requestId": "c441c70a-3b03-4e7b-b938-0463f4385b40",
     "lastModifiedTime": "2022-03-31T12:03:50.236"
 }
 
 */
