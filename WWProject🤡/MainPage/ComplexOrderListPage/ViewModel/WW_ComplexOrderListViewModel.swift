//
//  WW_ComplexOrderListViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/31.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_ComplexOrderListViewModel: WW_BaseViewModel {
    var productsArray = [WW_ComplexOrderSingleOrderData]()
    
    func reloadOrderListCurrentPage(page:Int,status:String,successBlock:@escaping Success_Block,failureBlock:@escaping Failure_Block){
        NetworkProvider.request(NetworkAPI.ComplexOrderList(currentpage: page, orderStatus: status)) { [self] result in
//            switch result {
//                case .success(_):
                    //订单列表 购物车 接口跨域 读保存本地json
//                    guard let data = result.value?.data  else { return }
//                    let dataAsString = String(data: data, encoding: .utf8)
//                    dataAsString?.jsonStringPrint()
//
//                    do {
//
//                        let myDecoder = JSONDecoder()
//                        let productModel = try myDecoder.decode(WW_ComplexOrderListModel?.self, from: data)
//                        let model :  WW_ComplexOrderListData = productModel!.data!
////                        self.dataModel = model
//                        if page == 1{
//                            self.productsArray = model.orderLst
//                        }else{
//                            self.productsArray.append(contentsOf: model.orderLst)
//                        }
//
//                        successBlock()
//                    } catch let error {
//                        print("Failed to create JSON with error: ", error)
//                    }
//                case .failure(_):
//                    failureBlock(result.description)
//                    break
//            }
            
            localGeoJsonData(page: page)
            setDateTime()
            successBlock()
        }
    }
    
    func localGeoJsonData(page:Int){

        guard let jsonUrl = Bundle.main.url(forResource: "orderList", withExtension: "geojson")//需要在BundleReaourse添加资源 在能读取
        else { return }

        do{
            let infoJsonData = try Data.init(contentsOf: jsonUrl)
//            let responese = try JSONSerialization.data(withJSONObject: infoJsonData, options: .mutableContainers) //write
            let responese = try JSONSerialization.jsonObject(with: infoJsonData, options: .mutableContainers) //read
            let myDecoder = JSONDecoder()
            let orderListModel = try myDecoder.decode(WW_ComplexOrderListModel?.self, from: infoJsonData)
            if page == 1{
                self.productsArray = orderListModel!.data!.orderLst
            }else{
                self.productsArray.append(contentsOf: orderListModel!.data!.orderLst)
            }
            print("Order List Response:",responese)
        }catch let error as Error?{
            print("data failure",error!)
        }
    }
    //MARK: 处理倒计时 logic
    func setDateTime(){
        for orderItem : WW_ComplexOrderSingleOrderData in self.productsArray{
            if orderItem.status == "SUBMITTED"{
                orderItem.time = orderTimeFormatted(timeStr: orderItem.placedAt!)
                orderItem.isTimers = true
            }else{
                orderItem.isTimers = false
            }
        }
    }
    
    func orderTimeFormatted(timeStr : String) -> TimeInterval{
        let past12_date = nsstringConversionNSDate(dateStr: timeStr)
        //MARK:time 30分钟后过期
        let past12Hour = past12_date.addingTimeInterval(1800)
        let timeStamp12Hours = dateConversionTimeStamp(date: past12Hour)
        let currentDate = Date.init()//当前时间 - 截止时间
        let startLongLong = dateConversionTimeStamp(date: currentDate)
        let finishDate = dateWithLongLong(longlongValue: timeStamp12Hours)
        let startDate = dateWithLongLong(longlongValue: startLongLong)
        let timeInterval = finishDate.timeIntervalSince(startDate)
        return timeInterval
    }
    
    func nsstringConversionNSDate(dateStr:String)-> Date{
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let datestr = dateFormatter.date(from: dateStr)
        return datestr!
    }
    
    func dateConversionTimeStamp(date:Date)->TimeInterval{
        let timeSp = date.timeIntervalSince1970 * 1000
        return timeSp
    }
    
    func dateWithLongLong(longlongValue:TimeInterval)->Date{
        let value = longlongValue/1000
        let nsTimeInterval = value
        let date = Date.init(timeIntervalSince1970: TimeInterval(nsTimeInterval))
        return date
    }
}
