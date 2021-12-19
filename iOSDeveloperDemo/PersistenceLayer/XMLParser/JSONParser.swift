//
//  JSONParser.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/7/14.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class JSONParser: NSObject{
	func start(json:Data){
		do{
			let dic : NSDictionary = try JSONSerialization.jsonObject(with: json, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            debugPrint(dic)
		}catch{
			
		}
		
		let request = URLRequest(url: NSURL(fileURLWithPath: "www.google.com") as URL)
		let session = URLSession.shared
		let datatask = session.dataTask(with: request)
        debugPrint(datatask)
	}
}
