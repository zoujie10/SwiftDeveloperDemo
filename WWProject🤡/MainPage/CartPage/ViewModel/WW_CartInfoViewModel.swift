//
//  WW_CartInfoViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/5.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
enum Cart_CellType : Int {
    case Cart_CellType_Normal = 0
    case Cart_CellType_Activity = 1
    case Cart_CellType_SecondKill = 2
}

class WW_CartInfoViewModel: WW_BaseViewModel {
    
    var arrayAllDatas = [WW_ActivityModel]()
    var arrayVaildData = [WW_ActivityModel]()
    var arrayInVaildData = [WW_ActivityModel]()
    
    func reloaCartInfo(successBlock:@escaping Success_Block,failureBlock:@escaping Failure_Block){
//        NetworkProvider.request(NetworkAPI.CartInfo) { result in
            
            self.localGeoJsonData()
            successBlock()
//        }
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
            self.arrayInVaildData = orderListModel!.data!.invalid
            for activity : WW_ActivityModel in self.arrayInVaildData{
                for item : WW_CartItem in activity.cartItemList{
                    item.isCanDelete = false
                    item.isSelected = false
                }
            }
            for activity : WW_ActivityModel in self.arrayVaildData{
                for item : WW_CartItem in activity.cartItemList{
                    item.isCanDelete = true
                    item.isSelected = true
                }
            }
            self.arrayVaildData = orderListModel!.data!.valid
            self.arrayAllDatas.append(contentsOf: orderListModel!.data!.valid)
            self.arrayAllDatas.append(contentsOf: orderListModel!.data!.invalid)
            print("Response:",responese)
        }catch let error as Error?{
            print("data failure",error!)
        }
    }
    
    
    func configCellModelData(index:Int)->WW_ActivityModel{
        let cellModel : WW_ActivityModel = self.arrayAllDatas[index]
        return cellModel
    }
    
    func getItemInSection(section:NSInteger)->NSInteger{
        let cellModel : WW_ActivityModel = self.arrayAllDatas[section]
        return cellModel.cartItemList.count
    }
    
    func getCellType(index:Int) -> Cart_CellType{
        let cellModel : WW_ActivityModel = self.arrayAllDatas[index]
        return Cart_CellType(rawValue: cellModel.type!)!
    }
}
