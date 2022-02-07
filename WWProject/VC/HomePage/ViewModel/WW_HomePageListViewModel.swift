//
//  WW_HomePageListViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/15.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomePageListViewModel: NSObject {
 
    func getHomePageList(){
        NetworkProvider.request(NetworkAPI.HomePageList) { result in
            switch result{
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    let dataAsString = String(data: data, encoding: .utf8)
                    dataAsString?.jsonStringPrint()
                    do {
                        let myDecoder = JSONDecoder()
                        let productModel = try myDecoder.decode(WW_SearchProductsModel?.self, from: data)
                        let model : WW_SearchResultProductsData = productModel!.data!
//                        self.productsArray.append(contentsOf: model.templateList ?? [WW_SearchProductsItem]())
//                        if self.productsArray.count < model.total ?? 0{
//                            self.searchNoMore = false
//                        }else{
//                            self.searchNoMore = true
//                        }
//                        self.dataResultComplete!()
                    } catch let error {
                        print("Failed to create JSON with error: ", error)
                    }
                case .failure(_):break
            }
        }
    }
}
