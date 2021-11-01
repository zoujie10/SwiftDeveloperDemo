//
//  ZJ_ProductsViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/1.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class ZJ_ProductsViewModel: NSObject {
    var sourceArray = Array<Array<ZJ_ProductsModel>>()
   
   
    func rightListProducts() -> [[ZJ_ProductsModel]] {
        var section1 = Array<ZJ_ProductsModel>()
        var section2 = Array<ZJ_ProductsModel>()
        var section3 = Array<ZJ_ProductsModel>()
        for i in 1...3{
            let model1 = ZJ_ProductsModel()
            model1.ProductName = "土豆+\(i)"
            model1.ProductIcon =  "计算"
            model1.productPrice = 37.22
            model1.ProductID = 100
            model1.keyInfo = "好吃的狠+\(i)"
            section1.append(model1)
        }
        for i in 1...3{
            let model2 = ZJ_ProductsModel()
            model2.ProductName = "玉米+\(i)"
            model2.ProductIcon =  "确认订单"
            model2.productPrice = 2.22
            model2.ProductID = 99
            model2.keyInfo = "健康的狠+\(i)"
            section2.append(model2)
        }
        for i in 1...3{
            let model3 = ZJ_ProductsModel()
            model3.ProductName = "豆浆+\(i)"
            model3.ProductIcon =  "运营报告"
            model3.productPrice = 1.00
            model3.ProductID = 98
            if i == 2{
                model3.keyInfo = "去编辑tableview页面吧+\(i)"
            }else{
                model3.keyInfo = "好喝的狠+\(i)"
            }
            section3.append(model3)
        }
        self.sourceArray.append(section1)
        self.sourceArray.append(section2)
        self.sourceArray.append(section3)
        return self.sourceArray
    }
    
    func insertProductToList(index : Int) -> [[ZJ_ProductsModel]]{
        let model3 = ZJ_ProductsModel()
        model3.ProductName = "豆浆+insert_data"
        model3.ProductIcon =  "搜索"
        model3.productPrice = 1.00
        model3.ProductID = 98
        model3.keyInfo = "好喝的狠+insert_data"
        var array = self.sourceArray[index]
        array.insert(model3, at: index)
        self.sourceArray[index] = array
        return self.sourceArray
    }
    
    func deleteProductToList(index : Int) -> [[ZJ_ProductsModel]]{
        if(self.sourceArray.count > 0 &&  self.sourceArray.count > index){
            var array = self.sourceArray[0]
            if(index < array.count){
                array.remove(at: index)
            }
            self.sourceArray[0] = array
        }
        return self.sourceArray
    }
}
