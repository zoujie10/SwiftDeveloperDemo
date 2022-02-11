//
//  WW_HomePageListViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/15.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomePageListViewModel: NSObject {
 
    typealias dataResultCompleteBlock = () -> Void
    var dataResultComplete : dataResultCompleteBlock?
    
    var homeModel = WW_HomePageListModel()
    
    func getHomePageList(){
        NetworkProvider.request(NetworkAPI.HomePageList) { [self] result in
            switch result{
                case .success(_):
                    guard let data = result.value?.data  else { return }
                    let dataAsString = String(data: data, encoding: .utf8)
                    dataAsString?.jsonStringPrint()
                    do {
                        let myDecoder = JSONDecoder()
                        self.homeModel = try myDecoder.decode(WW_HomePageListModel?.self, from: data)!
            
                        self.dataResultComplete!()
                        
                    } catch let error {
                        print("Failed to create JSON with error: ", error)
                    }
                case .failure(_):break
            }
        }
    }
    
    func itemTypeArray()->[String]{
        let array : [WW_HomeItemModel] = self.homeModel.data?.filter() { $0.asseType != "1" } ?? [WW_HomeItemModel]()
        let assArray = array.map{
            return($0.asseType)
        }
        return assArray as! [String]
    }
    
    func cellHeight(asseType : Int) -> Float{
        let type : WW_HomeItemType = WW_HomeItemType(rawValue: asseType) ?? .WW_HomeItemTypeNone
        switch type {
            case .WW_HomeItemTypeNone:
                return 0.1
            case .WW_HomeItemTypeBanner:
                return 120
            default:
                return 0.1
        }
        
    }
}
