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
}
extension NetworkAPI:TargetType{
    public var baseURL: URL{
        switch self {
            case .CategoryProductsList:
                return URL(string:WW_CategoryProductsList_Url)!
        }
    }
    
    // 对应的不同API path
    var path: String {
        switch self {
            case .CategoryProductsList: return ""
        }
    }
    
    // 请求类型
    public var method: Moya.Method {
        return .post
    }
    
    // 请求任务事件（这里附带上参数）
    public var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
                
            case .CategoryProductsList(let catkey):
                parmeters["catkey"] = catkey
                parmeters["channelId"] = "S09033033001"
                parmeters["areas"] = "DN"
                parmeters["pageSize"] = "10000"
                return .requestParameters(parameters: parmeters, encoding: JSONEncoding.default)
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

