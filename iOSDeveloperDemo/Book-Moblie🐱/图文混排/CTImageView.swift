//
//  CTImageView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/16.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
let picWidth = CGFloat(200)
let picHeight = CGFloat(300)

class CTImageView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        UIColor.brown.setFill()
        UIRectFill(rect)
        
//        var ctRunCallback = CTRunDelegateCallbacks(version: kCTRunDelegateVersion1,dealloc:{(refCon) -> Void in
//            
//        }
//                                                    {(refCon) -> Void in
//        },getAscent: { (refCon)-> CGFloat in
//
//        },getDescent: { (refCon)-> CGFloat in
//
//        }){(refCon) -> CGFloat in
//            return picWidth
//        }
    }
}
