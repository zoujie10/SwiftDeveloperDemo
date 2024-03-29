//
//  SwiftSlideAnimationButton.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/14.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import MapKit

class SwiftSlideAnimationButton: UIView {
    
    var btnTitle : String = ""
    var IndexTag : Int = 0
    typealias clickBlock = (Int) -> Void
    var clickBlock : clickBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title : String){
        self.init()
        self.btnTitle = title
    }
    
    override func draw(_ rect: CGRect) {
        //先添加画布
        let context = UIGraphicsGetCurrentContext()
        context?.addRect(rect)
        
        /*
         圆角矩形
         坑：如果不用CGRectInset，则白色边框会模糊,(猜测：在进行填充时，会影响边框)
         CGRectInset使用：平移且缩小
         */

        //指定位置圆角矩形
        let path = UIBezierPath.init(roundedRect:rect.insetBy(dx: 1, dy: 1), cornerRadius: rect.size.height/2)
        
        //设置描边颜色
        let color = UIColor.white
        UIColor.blue.setStroke()
        path.lineWidth = 1
        color.setFill()
        //设置描边和填充

        path.fill()
        path.stroke()
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let attr = [NSAttributedStringKey.paragraphStyle:style,NSAttributedStringKey.font:UIFont.systemFont(ofSize: 24),NSAttributedStringKey.foregroundColor:UIColor.red]
        let size = btnTitle.size(withAttributes: attr)
        let r = CGRect(x: rect.origin.x, y: rect.origin.y + (rect.size.height - size.height)/2.0, width: rect.size.width, height: rect.size.height)
        btnTitle.draw(in: r, withAttributes: attr)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.clickBlock != nil{
            self.clickBlock!(self.IndexTag)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
