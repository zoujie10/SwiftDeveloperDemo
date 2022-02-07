//
//  WW_ClassificationRightProductsViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/6.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_ClassificationRightProductsViewModel: NSObject {
    
    var productsArray = [WW_ProductListInfoModel]()
    
    typealias dataProductCompleteBlock = () -> Void
    var dataProductComplete : dataProductCompleteBlock?
    
    func requestRightByMoya(catkey:String){
        
        NetworkProvider.request(NetworkAPI.CategoryProductsList(catkey: catkey)) { result in
            
            switch result {
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    let dataAsString = String(data: data, encoding: .utf8)
                    dataAsString?.jsonStringPrint()
                    
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
