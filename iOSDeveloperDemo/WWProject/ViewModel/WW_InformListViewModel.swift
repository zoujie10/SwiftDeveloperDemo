//
//  WW_InformListViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/16.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_InformListViewModel: NSObject {
    
    var productsArray = [WWBDInformItem]()
    
    typealias dataInformListCompleteBlock = () -> Void
    var dataInformListComplete : dataInformListCompleteBlock?
    
    func getInformOrderList(status:String,currentPage:Int,pageSize:Int){
        let params = ["currentPage":currentPage,
                      "pageSize":10,
                      "status":status,
                      "memberKey":"17721789"] as [String : Any]
        NetworkProvider.request(NetworkAPI.kBDInformPriceOrderList(params: params)) { result in
            switch result {
                case .success(_):
                    guard let data = result.value?.data  else { return }
//                    let dataAsString = String(data: data, encoding: .utf8)
//                    print("responese ---- \(String(describing: dataAsString))")
                    
                    do {
                        
                        let myDecoder = JSONDecoder()
                        let productModel = try myDecoder.decode(WW_BDInformOrderListModel?.self, from: data)
                        let model :  WWBDInformData = productModel!.data!
                        if currentPage == 1{
                            self.productsArray = model.records ?? [WWBDInformItem]()
                        }else{
                            self.productsArray.append(contentsOf: model.records!)
                        }
                        
                        self.dataInformListComplete!()
                        
                    } catch let error {
                        print("Failed to create JSON with error: ", error)
                    }
                case .failure(_): break
            }
        }
    }
}
