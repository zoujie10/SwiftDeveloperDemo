//
//  UIViewAnimation.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/8/5.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
	func shakeToView(){
		let popAnimation = CAKeyframeAnimation(keyPath: "transform")
		popAnimation.duration = 0.35
		popAnimation.values = [NSValue.init(caTransform3D: CATransform3DMakeScale(0.01, 0.01, 1.0)),
							   NSValue.init(caTransform3D: CATransform3DMakeScale(1.00, 1.00, 1.0)),
							   NSValue.init(caTransform3D: CATransform3DMakeScale(0.91, 0.91, 1.0)),
							   NSValue.init(caTransform3D: CATransform3DIdentity)]
		popAnimation.keyTimes = [0.0,0.5,0.75,0.8]
		popAnimation.timingFunctions = [CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseInEaseOut),
										CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseInEaseOut),
										CAMediaTimingFunction.init(name:kCAMediaTimingFunctionEaseInEaseOut)]
		self.layer.add(popAnimation, forKey: nil)
	}
}
