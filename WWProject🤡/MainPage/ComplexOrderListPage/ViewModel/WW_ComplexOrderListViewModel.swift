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
        NetworkProvider.request(NetworkAPI.ComplexOrderList(currentpage: page, orderStatus: status)) { result in
            switch result {
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    let dataAsString = String(data: data, encoding: .utf8)
                    dataAsString?.jsonStringPrint()
                    
                    do {
                        
                        let myDecoder = JSONDecoder()
                        let productModel = try myDecoder.decode(WW_ComplexOrderListModel?.self, from: data)
                        let model :  WW_ComplexOrderListData = productModel!.data!
//                        self.dataModel = model
                        if page == 1{
                            self.productsArray = model.orderLst 
                        }else{
                            self.productsArray.append(contentsOf: model.orderLst)
                        }
                        
                        successBlock()
                    } catch let error {
                        print("Failed to create JSON with error: ", error)
                    }
                case .failure(_):
                    failureBlock(result.description)
                    break
            }
        }
    }
}
