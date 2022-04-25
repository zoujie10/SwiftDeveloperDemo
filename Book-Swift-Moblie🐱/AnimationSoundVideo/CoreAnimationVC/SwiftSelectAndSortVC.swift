//
//  SwiftSelectAndSortVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/13.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class SwiftSelectAndSortVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.3)
        creatUI()
    }
    func creatUI(){
        self.view.addSubview(self.bgView)
        self.bgView.frame = CGRect(x: WWScreenWidth, y: 0, width: WWScreenWidth-100, height: WWScreenHeight)
        UIView.animate(withDuration: 0.3) {
            self.bgView.frame.origin.x = 100
        }
    }
    
    lazy var bgView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.orange
        return v
    }()
    
    
    func showVC(){
        WW_keyWindow?.rootViewController?.addChildViewController(self)
        WW_keyWindow?.addSubview(self.view)
        self.view.bringSubview(toFront: self.bgView)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: view)
        let layer = self.view.layer.hitTest(point)
        if layer == self.view.layer{
            UIView.animate(withDuration: 0.3) {
                self.bgView.frame.origin.x = WWScreenWidth
            } completion: { Bool in
                self.removeFromParentViewController()
                self.view.removeFromSuperview()
            }
        }
    }
}
