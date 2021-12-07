//
//  WW_ClassificationLeftTagsViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/6.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import Alamofire

class WW_ClassificationLeftTagsViewModel: NSObject {
    var tagsArray = [WW_CategoryInfoItemModel]()
    
    typealias dataCompleteBlock = () -> Void
    var dataComplete : dataCompleteBlock?
    
    func requestLeftTag(){
        var parmeters: [String : Any] = [:]
        parmeters["areas"] = "DN"
        parmeters["channelId"] = "S09033033001"
        NetworkProvider.request(NetworkAPI.CategoryTagsList(params: parmeters)) { result in

            switch result {
                case .success(_):
                    guard let data = result.value?.data  else { return }
//                    let dataAsString = String(data: data, encoding: .utf8)
//                    print("responese ---- \(String(describing: dataAsString))")
    
                    let productModel = try? JSONDecoder().decode(WW_TagsModel.self, from:data)
                    let model :  WW_CategoryInfoModel = productModel!.data
                    self.tagsArray = model.categoryInfo
                    self.dataComplete!()
                    
                case .failure(_): break
            }
        }
    
    }
    
    //设置选择cell
    func selectedAtRowCell(row : NSInteger){
        for i in 0..<self.tagsArray.count{
            self.tagsArray[i].isSelected = false
            self.tagsArray[row].isSelected = true//选中
        }
    }
}
