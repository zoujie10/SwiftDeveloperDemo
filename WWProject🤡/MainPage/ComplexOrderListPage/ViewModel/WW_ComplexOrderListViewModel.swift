//
//  WW_ComplexOrderListViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/31.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_ComplexOrderListViewModel: WW_BaseViewModel {
    var productsArray = [WW_ComplexOrderSingleOrderData]()
    
    func reloadOrderListCurrentPage(page:Int,status:String,successBlock:@escaping Success_Block,failureBlock:@escaping Failure_Block){
        NetworkProvider.request(NetworkAPI.ComplexOrderList(currentpage: page, orderStatus: status)) { [self] result in
//            switch result {
//                case .success(_):
                    //订单列表 购物车 接口跨域 读保存本地json
//                    guard let data = result.value?.data  else { return }
//                    let dataAsString = String(data: data, encoding: .utf8)
//                    dataAsString?.jsonStringPrint()
//
//                    do {
//
//                        let myDecoder = JSONDecoder()
//                        let productModel = try myDecoder.decode(WW_ComplexOrderListModel?.self, from: data)
//                        let model :  WW_ComplexOrderListData = productModel!.data!
////                        self.dataModel = model
//                        if page == 1{
//                            self.productsArray = model.orderLst
//                        }else{
//                            self.productsArray.append(contentsOf: model.orderLst)
//                        }
//
//                        successBlock()
//                    } catch let error {
//                        print("Failed to create JSON with error: ", error)
//                    }
//                case .failure(_):
//                    failureBlock(result.description)
//                    break
//            }
            localGeoJsonData(page: page)
            successBlock()
        }
    }
    
    func localGeoJsonData(page:Int){

        guard let jsonUrl = Bundle.main.url(forResource: "orderList", withExtension: "geojson")//需要在BundleReaourse添加资源 在能读取
        else { return }

        do{
            let infoJsonData = try Data.init(contentsOf: jsonUrl)
//            let responese = try JSONSerialization.data(withJSONObject: infoJsonData, options: .mutableContainers) //write
            let responese = try JSONSerialization.jsonObject(with: infoJsonData, options: .mutableContainers) //read
            let myDecoder = JSONDecoder()
            let orderListModel = try myDecoder.decode(WW_ComplexOrderListModel?.self, from: infoJsonData)
            if page == 1{
                self.productsArray = orderListModel!.data!.orderLst
            }else{
                self.productsArray.append(contentsOf: orderListModel!.data!.orderLst)
            }
            print("Order List Response:",responese)
        }catch let error as Error?{
            print("data failure",error!)
        }
    }
}
