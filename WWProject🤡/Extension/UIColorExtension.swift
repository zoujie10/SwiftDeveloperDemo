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
    
	open class func defaultLightGrayBgViewColor()->UIColor{
        return UIColor(r: 244, g: 244, b: 244)
    }

	open class func defaultNavRedBgViewColor()->UIColor{
        return UIColor(r: 249, g: 60, b: 89)
    }
	open class func colorWithHex(withHex hex:integer_t, alpha:CGFloat) -> UIColor{
		return UIColor(red: CGFloat((hex >> 16) & 0xff)/255.0, green: CGFloat((hex >> 8) & 0xff)/255.0, blue: CGFloat(hex & 0xff)/255.0, alpha: alpha)
	}
}

