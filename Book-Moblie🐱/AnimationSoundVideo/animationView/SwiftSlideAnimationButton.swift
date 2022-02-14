//
//  SwiftSlideAnimationButton.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/14.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class SwiftSlideAnimationButton: UIView {
    
    var btnTitle : String = ""
    
    typealias clickBlock = () -> Void
    var clickBlock : clickBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title : String){
        self.init()
        self.btnTitle = title
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.clickBlock != nil{
            self.clickBlock!()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
