//
//  UIColorExtension.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/14.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(r : CGFloat,g : CGFloat, b : CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    convenience init(r : CGFloat,g : CGFloat, b : CGFloat , a:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    class var random: UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)),
                       g: CGFloat(arc4random_uniform(256)),
                       b: CGFloat(arc4random_uniform(256)))
    }
    
    func image() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
