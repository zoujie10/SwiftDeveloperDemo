//
//  WW_InformListViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/16.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_InformListViewModel: WW_BaseViewModel {
    
    var productsArray = [WWBDInformItem]()
    var dataModel =  WWBDInformData()
    
    func getInformOrderList(status:String,currentPage:Int,pageSize:Int, successBlock : @escaping Success_Block, failureBlock : @escaping Failure_Block){
   
        NetworkProvider.request(NetworkAPI.kBDInformPriceOrderList(currentpage: currentPage, orderStatus: status, pagesize: 10)) { result in
            switch result {
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    let dataAsString = String(data: data, encoding: .utf8)
                    dataAsString?.jsonStringPrint()
                    
                    do {
                        
                        let myDecoder = JSONDecoder()
                        let productModel = try myDecoder.decode(WW_BDInformOrderListModel?.self, from: data)
                        let model :  WWBDInformData = productModel!.data!
                        self.dataModel = model
                        if currentPage == 1{
                            self.productsArray = model.records ?? [WWBDInformItem]()
                        }else{
                            self.productsArray.append(contentsOf: model.records!)
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
