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
    
    var requestValue : String = ""
    var requestKey : String{
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
    var itemsArray : [String]
    var sectionTitle : String
    
    var requestKey : String = ""
    var requestKeyValue : String{
        set (newValue){
            requestKey = newValue
        }
        
        get {
            return requestKey
        }
    }
    
    var requestValue : [String] = []
    var requestValueArray : [String]{
        
        set (newValue){
            requestValue = newValue
        }
        
        get {
            return requestValue
        }
    }
    init(items:[String],title:String){
        itemsArray = items
        sectionTitle = title
    }
}
class WW_CustomerFiltrateViewModel: NSObject {
    let originFiltrateArray : [WW_CustomerFiltrateSectionMode]
    let originSortArray : [WW_CustomerFiltrateSectionMode]
    
    
    override init() {
        
        let oneModel = WW_CustomerFiltrateSectionMode.init(items: ["全部","A1","A2","A3","B1","B2","B3","C1","C2","C3","D1","D2","D3","未下单"], title: "客户等级")
        oneModel.requestValue = ["","A1","A2","A3","B1","B2","B3","C1","C2","C3","D1","D2","D3","未下单"];
        oneModel.requestKey = "customerLevel"
        
        let twoModel = WW_CustomerFiltrateSectionMode.init(items: ["全部","审核中","驳回","通过"], title: "客户状态")
        
        let threeModel = WW_CustomerFiltrateSectionMode.init(items: ["客户等级","订单总数","订单总金额","上次下单时间"], title: "类型选择")
       
        let fourModel = WW_CustomerFiltrateSectionMode.init(items: ["由高到低","由低到高"], title: "排序规则")
        self.originFiltrateArray = [oneModel,twoModel]
        self.originSortArray = [threeModel,fourModel]
        
        super.init()
    }
    
    func resetData(){
        
    }
    
    func confirmData(){
        
    }
}
