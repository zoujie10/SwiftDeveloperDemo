//
//  MoYaNetManage.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/2.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import Moya


let NetworkProvider = MoyaProvider<NetworkAPI>()

enum NetworkAPI {

    case CategoryProductsList(catkey:String)
    case CategoryTagsList(params : [String:Any])
    case kBDInformPriceOrderList(currentpage : Int, orderStatus : String ,pagesize : Int)
    case SearchWords
    case SearchProducts(searchKey:String,currentpage : Int,pagesize : Int)
    case GuessYourLike(pageIndex : Int)
}
extension NetworkAPI:TargetType{
    
    var baseURL: URL {
        return URL(string: WW_BaseURL)!
    }
    // 对应的不同API path
    var path: String {
        switch self {
            case .CategoryProductsList:
                return WW_CategoryProductsList_Url
             case .CategoryTagsList:
                return WW_CategoryTagList_Url
            case .kBDInformPriceOrderList:
                return WW_kBDInformPriceOrderList
            case .SearchWords:
                return WW_kSearchKeywordsUrl
            case .SearchProducts:
                return WW_kHomeSearchUrl
            case .GuessYourLike:
                return WW_kGuessYourLikeUrl
        }
    }
    
    // 请求类型
    public var method: Moya.Method {
        return .post
    }
    
    // 请求任务事件
    public var task: Task {
        var parmetersInner: [String : Any] = [:]
        parmetersInner["memberKey"] = "17721789"
        switch self {
                //MARK:传参 注意大小下 也要区分
            case .CategoryProductsList(let catkey):
                parmetersInner["catKey"] = catkey
                parmetersInner["channelId"] = "S09033033001"
                parmetersInner["ceoStatus"] = "1"
                parmetersInner["areas"] = "DN"
                parmetersInner["pageSize"] = "10000"
                parmetersInner["page"] = 1
                return .requestParameters(parameters: parmetersInner, encoding: JSONEncoding.default)
           
            case .CategoryTagsList(let parmeters):
                return .requestParameters(parameters: parmeters, encoding: JSONEncoding.default)
            
            case .kBDInformPriceOrderList(let currentPage, let status, let pagesize):
                parmetersInner["currentPage"] = currentPage
                parmetersInner["pageSize"] = pagesize
                parmetersInner["status"] = status
                return .requestParameters(parameters: parmetersInner, encoding: JSONEncoding.default)
                
            case .SearchWords:
                parmetersInner["channelId"] = "S09033033001"
                parmetersInner["isWholeSale"] = "0"
                return .requestParameters(parameters: parmetersInner, encoding: JSONEncoding.default)
                
            case .SearchProducts(let searchKey, let currentPage,let pageSize):
                parmetersInner["searchKey"] = searchKey
                parmetersInner["searchType"] = "ordinaryDesc"
                parmetersInner["ceoStatus"] = "1"
                parmetersInner["areas"] = "DN"
                parmetersInner["pageSize"] = pageSize
                parmetersInner["page"] = currentPage
                parmetersInner["isWholeSale"] = "1"
                return .requestParameters(parameters: parmetersInner, encoding: JSONEncoding.default)
            case .GuessYourLike(let page):
                parmetersInner["page"] = page
                parmetersInner["isWholeSale"] = "1"
                parmetersInner["areas"] = "DN"
                parmetersInner["channelId"] = "S09033033001"
                return .requestParameters(parameters: parmetersInner, encoding: JSONEncoding.default)
                 
        }
    }
    
    // 是否执行Alamofire验证
    public var validate: Bool {
        return false
    }
    
    // 这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    // 请求头
    public var headers: [String: String]? {
        return ["Content-Type":"application/json"]
    }
}

