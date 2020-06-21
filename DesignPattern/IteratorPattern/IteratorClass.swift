//
//  IteratorClass.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 6/11/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class IteratorClass: IteratorProtocol {
    var hasnext : Bool
    var index : NSInteger
    var arrayCantainter : Array<Any>

    init(array : Array<Any>) {
        index = 0
        hasnext = false
        arrayCantainter = array
    }
    func enumertorMethod() -> Any?{
        if !hasNext(){
            hasnext = false
            return nil
        }
        index += 1
        return arrayCantainter[index]
    }
    
    func hasNext() -> Bool{
        if index > arrayCantainter.count{
            return false
        }
        return true
    }
}
