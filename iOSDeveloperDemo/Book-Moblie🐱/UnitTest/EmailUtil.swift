//
//  EmailUtil.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/4.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

struct RegexHelper{
    let regex : NSRegularExpression?
    
    init(_ pattern : String){
        do {
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        }catch{
            regex = nil
        }
    }
    
    func match(_ input : String) -> Bool{
        if let matches = regex?.matches(in: input, options: .reportProgress, range: NSRange(location: 0,length: input.lengthOfBytes(using: String.Encoding.utf8))){
            return matches.count > 0
        }else{
            return false
        }
    }
}

class EmailUtil: NSObject {
    func validateEmail(email:String) -> Bool{
        let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"//检验邮箱规则
        let matcher = RegexHelper(pattern)
        
        if matcher.match(email){
            return true
        }else{
            return false
        }
    }
}
