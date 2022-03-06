//
//  WW_CustomerFiltrateViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/25.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
class WW_CustomerFiltrateItemModel : NSObject {

    var titile : String

    var select : Bool = false
    var isSelect : Bool {
        set (newValue){
            select = newValue
        }
        get {
            return select
        }
    }
    
    var requestKey : String = ""
    var requestkey : String{
        set (newValue){
            requestKey = newValue
        }
        get {
            return requestKey
        }
    }
        
    var requestValue : String = ""
    var requestvalue : String{
        set (newValue){
            requestValue = newValue
        }
        
        get {
            return requestValue
        }
    }
    
    init(title:String){
        self.titile = title
    }
}

class WW_CustomerFiltrateSectionMode : NSObject{
    var itemsArray : [WW_CustomerFiltrateItemModel]
    var sectionTitle : String
//    var requestKey : String = ""
//    var requestKeyValue : String{
//        set (newValue){
//            requestKey = newValue
//        }
//
//        get {
//            return requestKey
//        }
//    }
    
//    var requestValue : [String] = []
//    var requestValueArray : [String]{
//
//        set (newValue){
//            requestValue = newValue
//        }
//
//        get {
//            return requestValue
//        }
//    }
    init(items:[WW_CustomerFiltrateItemModel],title:String){
        itemsArray = items
        sectionTitle = title
    }
}
class WW_CustomerFiltrateViewModel: NSObject {
    let originFiltrateArray : [WW_CustomerFiltrateSectionMode]
//    let originSortArray : [WW_CustomerFiltrateSectionMode]
    
    
    override init() {
        let item  = WW_CustomerFiltrateItemModel.init(title: "全部")
        item.titile = "全部收入"
        item.requestkey = " A1"
        item.requestValue = "All"
        item.isSelect = false
        
        let item1  = WW_CustomerFiltrateItemModel.init(title: "试吃费用")
        item1.titile = "试吃费用"
        item1.requestkey = " A2"
        item1.requestValue = "All"
        item1.isSelect = true
        
        let item2  = WW_CustomerFiltrateItemModel.init(title: "文宣品费用")
        item2.titile = "文宣品费用"
        item2.requestkey = " A3"
        item2.requestValue = "All"
        item2.isSelect = false
        
        let item3  = WW_CustomerFiltrateItemModel.init(title: "文宣品费用")
        item3.titile = "特陈奖"
        item3.requestkey = " A3"
        item3.requestValue = "All"
        item3.isSelect = false
        
        let item4  = WW_CustomerFiltrateItemModel.init(title: "文宣品费用")
        item4.titile = "排名奖"
        item4.requestkey = " A3"
        item4.requestValue = "All"
        item4.isSelect = false
        let oneModel = WW_CustomerFiltrateSectionMode.init(items: [item,item1,item2,item3,item4], title: "收入")
 
        let item11  = WW_CustomerFiltrateItemModel.init(title: "全部")
        item11.titile = "全部收入"
        item11.requestkey = " A1"
        item11.requestValue = "All"
        item11.isSelect = true
        
        let item12  = WW_CustomerFiltrateItemModel.init(title: "试吃费用")
        item12.titile = "试吃费用"
        item12.requestkey = " A2"
        item12.requestValue = "All"
        item12.isSelect = false
        
        let item13  = WW_CustomerFiltrateItemModel.init(title: "文宣品费用")
        item13.titile = "文宣品费用"
        item13.requestkey = " A3"
        item13.requestValue = "All"
        item13.isSelect = false
        let twoModel = WW_CustomerFiltrateSectionMode.init(items: [item11,item12,item13], title: "使用")
        
        let threeModel = WW_CustomerFiltrateSectionMode.init(items: [item], title: "金额")
//        let threeModel = WW_CustomerFiltrateSectionMode.init(items: ["客户等级","订单总数","订单总金额","上次下单时间"], title: "类型选择")
       
//        let fourModel = WW_CustomerFiltrateSectionMode.init(items: [item], title: "排序规则")
        self.originFiltrateArray = [oneModel,twoModel,threeModel]
//        self.originSortArray = [fourModel]
        
        super.init()
    }
    
    func resetData(){
        for model in self.originFiltrateArray{
            for index in 0 ..< model.itemsArray.count {
                if index == 0{
                    model.itemsArray[index].select = true
                }else{
                    model.itemsArray[index].select = false
                }
            }
        }
    }
    
    func confirmData() -> [String:String]{
        let dic = NSMutableDictionary()
        for model in self.originFiltrateArray{
            for item in model.itemsArray {
                if item.select == true {
                    dic.setObject(item.requestvalue, forKey:item.requestkey as NSCopying)
                }
            }
        }
        return dic as! [String : String]
    }
}
