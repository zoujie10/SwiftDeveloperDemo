//
//  ZJ_TextField.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/14.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class ZJ_TextField: UITextField {

    var placeholderFrame : CGRect?
    
    //设置 placeholder 的frame 需要 重写placeholderRect  类似的还有textRect，borderRect等
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        return placeholderFrame!
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return placeholderFrame!
    }
    
    override func borderRect(forBounds bounds: CGRect) -> CGRect {
        return placeholderFrame!
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(frame: CGRect ,placeholderFrame : CGRect) {
        self.placeholderFrame = placeholderFrame
        super.init(frame: frame)
        self.returnKeyType = .done
    }
}
