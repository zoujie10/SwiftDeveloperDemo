//
//  ZJAlgorithm.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/11.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class ZJAlgorithm: NSObject {
    override init() {
        super.init()
    }
    //TODO
    func Sort_Bubbling(){
        let array = [12,14,19,14,15,12,123,1234]
        var sortArray = [Int]()
//        array.min()
        for i in array{
            var minNum : Int?
            for j in array{
                if (minNum == nil){
                    minNum = min(i, j)
                }else{
                    minNum = min(minNum!, j)
                }
            }
            sortArray.append(minNum!)
        }
        print(sortArray)
    }
}
