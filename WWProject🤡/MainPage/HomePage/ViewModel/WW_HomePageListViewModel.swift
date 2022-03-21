//
//  WW_HomePageListViewModel.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/15.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import SwiftUI

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
    
    //MARK: 过滤 “搜索”的 数据
    func itemTypeArray()->[String]{
        let array : [WW_HomeItemModel] = self.homeModel.data?.filter() { $0.asseType != "1" } ?? [WW_HomeItemModel]()
        let assArray = array.map{
            return($0.asseType)
        }
        return assArray as! [String]
    }
    
    //MARK: 取 item 的model
    func creatItemViewModel(index : NSInteger) -> WW_HomeItemModel?{
        let array : [WW_HomeItemModel] = self.homeModel.data?.filter() { $0.asseType != "1" } ?? [WW_HomeItemModel]()
        if  self.homeModel.data != nil{
            return array[index]
        } else{
            return nil
        }
    }
    
    //MARK: 取 推荐商品 item 的model
    func creatGoodsListViewModel(section : NSInteger , item : NSInteger) -> WW_HomeItemDetailModel?{
        let array : [WW_HomeItemModel] = self.homeModel.data?.filter() { $0.asseType != "1" } ?? [WW_HomeItemModel]()

        let list = NSMutableArray()
        for item in array[section].configureAttributeList!.enumerated(){
            list.addObjects(from: item.element)
        }
        if  self.homeModel.data != nil{
            return list[item] as? WW_HomeItemDetailModel
        } else{
            return nil
        }
    }
    //MARK: 取 推荐商品 count
    func creatGoodsListCountViewModel(section : NSInteger) -> NSInteger?{
        let array : [WW_HomeItemModel] = self.homeModel.data?.filter() { $0.asseType != "1" } ?? [WW_HomeItemModel]()
        let list = NSMutableArray()
        for item in array[section].configureAttributeList!.enumerated(){
            list.addObjects(from: item.element)
        }
        if  self.homeModel.data != nil{
            return list.count
        } else{
            return nil
        }
    }
    
    
    //MARK: Item 大小
    func cellSize(asseType : Int) -> CGSize{
        let type : WW_HomeItemType = WW_HomeItemType(rawValue: asseType) ?? .WW_HomeItemTypeNone

        switch type {
            case .WW_HomeItemTypeNone:
                return CGSize.init(width: WWScreenWidth, height:0.1)
            case .WW_HomeItemTypeBanner:
                return CGSize.init(width: WWScreenWidth, height:CGFloat(400*(WWScreenWidth-30)/1008.0))
            case .WW_HomeItemTypeChannelFirst:
                return CGSize.init(width: WWScreenWidth, height:120)
            case .WW_HomeItemTypeChannelSecond:
                return CGSize.init(width: WWScreenWidth, height:120)
            case .WW_HomeItemTypeChannelThird:
                return CGSize.init(width: WWScreenWidth, height:120)
            case .WW_HomeItemTypeActivity  :
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-30)/336)*110+14)
            case .WW_HomeItemTypeCouponFirst :
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-30-8)/(275+55.0)*73)+14)
            case .WW_HomeItemTypeCouponSecond :
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-30-16)/(86.67*3+55.0)*73)+14)
            case .WW_HomeItemTypeCouponThird :
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-30-24)/(275+55.0)*73)+14)
            case .WW_HomeItemTypeNotify   :
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-30)/336)*30+11)
            case .WW_HomeItemTypeMagicFirst  ://两宫格
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-30-16-8)*0.5/156*103)+14+16)
            case .WW_HomeItemTypeMagicSecond:
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-30-16-8)/156*103)+14+16)
            case .WW_HomeItemTypeMagicThird :
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-30-16-8)/156*103)+14+16)
            case .WW_HomeItemTypeGoods    :
                return CGSize.init(width: (WWScreenWidth-40)/2, height:250)
            case .WW_HomeItemTypeLike    :
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-24)/330)*15+14)
            case .WW_HomeItemTypeLife   :
                return CGSize.init(width: WWScreenWidth, height:CGFloat((WWScreenWidth-24)/330)*15+14)
            case .WW_HomeItemTypeChannel :
                return CGSize.init(width: WWScreenWidth, height:156)
            case .WW_HomeItemTypeGift,.WW_HomeItemTypeKill:
                return CGSize.init(width: WWScreenWidth, height:136+10.0)
            case .WW_HomeItemTypeNewUser :
                return CGSize.init(width: WWScreenWidth, height:136+10.0)
            case .WW_HomeItemTypeGoodsList :
                return CGSize.init(width: WWScreenWidth, height:156)
//                return 156 //TODO row 1 or 2
            // 22被安卓占用
            case .WW_HomeItemTypeChannelNew :
                return CGSize.init(width: WWScreenWidth, height:156)
            default:
                return CGSize(width: WWScreenWidth, height: 0.1)
        }
        
    }
}
