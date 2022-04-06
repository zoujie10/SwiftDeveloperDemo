//
//  WW_CartInfoViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/5.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartInfoViewModel: WW_BaseViewModel {
    
    var arrayAllDatas = [WW_ActivityModel]()
    var arrayVaildDatas = [WW_ActivityModel]()
    var arrayInVaildDatas = [WW_ActivityModel]()
    
    func reloaCartInfo(successBlock:@escaping Success_Block,failureBlock:@escaping Failure_Block){
        NetworkProvider.request(NetworkAPI.CartInfo) { result in
            
            self.localGeoJsonData()
            successBlock()
        }
    }
    
    func localGeoJsonData(){

        guard let jsonUrl = Bundle.main.url(forResource: "cartData", withExtension: "geojson")//需要在BundleReaourse添加资源 在能读取
        else { return }

        do{
            let infoJsonData = try Data.init(contentsOf: jsonUrl)
//            let responese = try JSONSerialization.data(withJSONObject: infoJsonData, options: .mutableContainers) //write
            let responese = try JSONSerialization.jsonObject(with: infoJsonData, options: .mutableContainers) //read
            let myDecoder = JSONDecoder()
            let orderListModel = try myDecoder.decode(WW_CartItemsData?.self, from: infoJsonData)
            
            print("Response:",responese)
        }catch let error as Error?{
            print("data failure",error!)
        }
    }
}
