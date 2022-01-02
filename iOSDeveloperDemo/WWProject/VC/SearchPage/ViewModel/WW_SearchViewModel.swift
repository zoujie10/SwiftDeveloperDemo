//
//  WW_SearchViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/22.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchViewModel: NSObject {
    var wordsArray = [WW_SearchHotWordsItem]()

    typealias datahotWordsCompleteBlock = () -> Void
    var datahotWordsComplete : datahotWordsCompleteBlock?
    
    
    func getHotWordsRequest(){
        NetworkProvider.request(NetworkAPI.SearchWords){ result in
            switch result {
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    //                    let dataAsString = String(data: data, encoding: .utf8)
                    //                    print("responese ---- \(String(describing: dataAsString))")
                    
                    do {
                        let myDecoder = JSONDecoder()
                        let productModel = try myDecoder.decode(WW_SearchHotWordsModel?.self, from: data)
                        let model :  WW_SearchHotWordsData = productModel!.data!
                        self.wordsArray = model.keywords ?? [WW_SearchHotWordsItem]()
                        self.datahotWordsComplete!()
                        
                    } catch let error {
                        print("Failed to create JSON with error: ", error)
                    }
                case .failure(_): break
            }
        }
    }
}
