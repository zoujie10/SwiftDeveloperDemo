//
//  WW__SearchResultViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/6.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchResultViewModel: NSObject {
    var productsArray = [WW_SearchProductsItem]()

    typealias dataResultCompleteBlock = () -> Void
    var dataResultComplete : dataResultCompleteBlock?
    
    func getSearchWords(serchWord:String,currentPage:Int,pageSize:Int){

        NetworkProvider.request(NetworkAPI.SearchProducts(searchKey: serchWord, currentpage: 1, pagesize: 1000)) { result in
            switch result{
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    let dataAsString = String(data: data, encoding: .utf8)
                    print("responese ---- \(String(describing: dataAsString))")
                    do {
                        let myDecoder = JSONDecoder()
                        let productModel = try myDecoder.decode(WW_SearchProductsModel.self, from: data)
                        let model : WW_SearchResultProductsData = productModel.data!
                        self.productsArray = model.templateList ?? [WW_SearchProductsItem]()
                        self.dataResultComplete!()
                    } catch let error {
                        print("Failed to create JSON with error: ", error)
                    }
                case .failure(_):break
            }
        }
    }
    
    
    
}
