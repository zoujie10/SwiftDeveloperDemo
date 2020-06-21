//
//  CopyClass.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 6/10/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class CopyClass: CopyPatternDelegate,NSCopying {
    var tempString : String
    var tempArray : [String]
    
    required init(tempStr:String,tempArr:[String]) {
        tempString = tempStr
        tempArray = tempArr
    }
    func copyMethod(object: Any) -> Any{
        let object = object
        return object
    }
    func deepCopyMethod(object: Any) -> Any{
        let object = object
        return object
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let object = type(of: self).init(tempStr: self.tempString, tempArr: self.tempArray)
        return object
    }
}
