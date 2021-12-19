//
//  ZJ_ProductsViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/1.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import Alamofire

class ZJ_ProductsViewModel: NSObject {
    var sourceArray = Array<Array<ZJ_ProductsModel>>()
    var tagsArray = [categoryInfoItemModel]()
    var productsArray = [WW_ProductListInfoModel]()
    
    typealias dataCompleteBlock = () -> Void
    var dataComplete : dataCompleteBlock?
   
    typealias dataProductCompleteBlock = () -> Void
    var dataProductComplete : dataProductCompleteBlock?
    
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
    
    //设置选择cell
    func selectedAtRowCell(row : NSInteger){
        for i in 0..<self.tagsArray.count{
            self.tagsArray[i].isSelected = false
            self.tagsArray[row].isSelected = true
        }
    }
    
    func requestLeftTag(){
        let headers : HTTPHeaders = [
            "Content-Type":"application/json"
        ]
        var param = ["channelId":"S09033033001"]
        param["areas"] = "DN"
        //POST
        Alamofire.request(WW_CategoryTagList_Url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseData {response in
            
            debugPrint(response)
            debugPrint(response.request as Any)//发送到服务端的请求
            debugPrint(response.response as Any)//服务端返回的响应
            debugPrint(response.result)//枚举  Success value有值。Failure value nil
            debugPrint(response.data as Any)//二级制数据
            debugPrint(response.timeline)//请求到收到响应的整个时间
            do {
                let productModel = try? JSONDecoder().decode(TagsModel.self, from: response.data!)
                let model :  categoryInfoModel = productModel!.data
                self.tagsArray = model.categoryInfo
                self.dataComplete!()
            }
        }
    }
    
    func requestRightByMoya(catkey:String){
    
        NetworkProvider.request(NetworkAPI.CategoryProductsList(catkey: catkey)) { result in

            switch result {
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    let dataAsString = String(data: data, encoding: .utf8)
                    print("responese ---- \(String(describing: dataAsString))")

                    do {
                        /**
                         model 数据类型不对应 解析报错:
                         typeMismatch(Swift.String，Swift.DecodingError.Context(codingPath:[CodingKeys（stringValue:“error”，intValue:nil）]，debugDescription:“应解码字符串，但找到字典instead."，underlyingError:nil））
                         */
                        let myDecoder = JSONDecoder()
                        let productModel = try myDecoder.decode(WW_ProductsListModel?.self, from: data)
                        let model :  WW_ProductsInfoModel = productModel!.data!
                        self.productsArray = model.commodityInfo ?? [WW_ProductListInfoModel]()
                        self.dataProductComplete!()
                    } catch let error {
                        print("Failed to create JSON with error: ", error)
                    }
                case .failure(_): break
            }
        }
        
    }
}
