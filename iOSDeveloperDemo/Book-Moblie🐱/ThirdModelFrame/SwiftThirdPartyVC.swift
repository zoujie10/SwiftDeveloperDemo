//
//  SwiftThirdPartyVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/29.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import Alamofire

class SwiftThirdPartyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        //model 框架
        //1.数据格式 XML ,Plist,JSON
        
        //2.AlamofireObjectMapper
        
        //3.ObjectMapper
        
        //4.Moya
        
        //5.SwiftJSON
        
        //swift4.0 Codable协议
        useCodableParse()
    }
    
    
    

    func useCodableParse(){
        let headers : HTTPHeaders = [
            "Content-Type":"application/json"
        ]
//        areas = LB;
//        channelId = B06022853001;
//        isWholeSale = 1;
        let param = ["channelId":"B06022853001"]
   
        //POST
        Alamofire.request(WW_CategoryTagList_Url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseData {response in
            
            let productModel = try! JSONDecoder().decode(useCodableModel.self, from: response.data!)
            let model :  subModel = productModel.data
            print("tags---count\(String(describing: model.categoryInfo.first?.displayName))")
        }
    }
}

//5.swift4.0 Codable协议
//继承Codable
struct items : Codable{
    var displayName : String
//    var productId : String
}

struct subModel : Codable {
    var categoryInfo : [items]
}

struct useCodableModel : Codable{
    var msg : String
    var code : Int
    var data : subModel
}
 
