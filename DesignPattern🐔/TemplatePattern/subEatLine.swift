//
//  subEatLine.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 6/10/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class subEatLine: MakeFood {
    
//    override init() {
//
//    }
    
    override func lineToEat() {
        super.lineToEat()
    }
    
    override func goToEat() {
        print("eat By myself")
        self.doOtherOpertion()
    }
    
    func doOtherOpertion(){
        print("Play a game")
    }
}

