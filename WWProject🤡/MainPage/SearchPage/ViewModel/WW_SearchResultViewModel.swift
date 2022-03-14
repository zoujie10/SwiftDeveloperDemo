//
//  WW__SearchResultViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/6.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import ObjectMapper

class WW_SearchResultViewModel: NSObject {
    //搜索结果
    var productsArray = [WW_SearchProductsItem]()
    typealias dataResultCompleteBlock = () -> Void
    var dataResultComplete : dataResultCompleteBlock?
    
    var searchNoMore : Bool = false
    
    func getSearchWords(serchWord:String,currentPage:Int,pageSize:Int){
        NetworkProvider.request(NetworkAPI.SearchProducts(searchKey: serchWord, currentpage: currentPage, pagesize: pageSize)) { result in
            switch result{
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    let dataAsString = String(data: data, encoding: .utf8)
                    dataAsString?.jsonStringPrint()
                    do {
                        let myDecoder = JSONDecoder()
                        let productModel = try myDecoder.decode(WW_SearchProductsModel?.self, from: data)
                        let model : WW_SearchResultProductsData = productModel!.data!
                        self.productsArray.append(contentsOf: model.templateList ?? [WW_SearchProductsItem]())
                        if self.productsArray.count < model.total ?? 0{
                            self.searchNoMore = false
                        }else{
                            self.searchNoMore = true
                        }
                        self.dataResultComplete!()
                    } catch let error {
                        print("Failed to create JSON with error: ", error)
                    }
                case .failure(_):break
            }
        }
    }
    
    //猜你喜欢
    var guessLikeArray = [WW_SearchProductsItem]()
    typealias guessYourLikeResultCompleteBlock = () -> Void
    var guessYourLikedataResultComplete : guessYourLikeResultCompleteBlock?
    
    var guessYourLikeNoMore : Bool = false
    
    func getGuessYourlike(page:Int){
        NetworkProvider.request(NetworkAPI.GuessYourLike(pageIndex: page)) { result in
            switch result{
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    let dataAsString = String(data: data, encoding: .utf8)
                    dataAsString?.jsonStringPrint()

                    do {
                        let myDecoder = JSONDecoder()
                        let productModel = try myDecoder.decode(WW_SearchProductsModel?.self, from: data)
                        let model : WW_SearchResultProductsData = productModel!.data!
                        self.guessLikeArray.append(contentsOf:model.templateList ?? [WW_SearchProductsItem]())
                        
                        if self.guessLikeArray.count < model.totalCount ?? 0{
                            self.guessYourLikeNoMore = false
                        }else{
                            self.guessYourLikeNoMore = true
                        }
                        
                        self.guessYourLikedataResultComplete!()
                    } catch let error {
                        print("Failed to create JSON with error: ", error)
                    }
                case .failure(_):break
            }
        }
    }
    
}
