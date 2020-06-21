//
//  DecorateViewController.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 5/14/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class DecorateViewController: UIViewController {

    let decorateImageView : UIImageView = UIImageView()
    var decorateImage = UIImage(named: "decorateImage")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        decorateImageView.frame = CGRect(x: (self.view.frame.width-300)/2, y: 200, width: 300, height: 300)
        
        let tempImage = decorateImage?.roundImage(cornerRadi: 16)
        
        decorateImageView.image = tempImage
        self.view.addSubview(decorateImageView)
        
        let btn = UIButton.init(frame: CGRect(x: (self.view.frame.width-50)/2, y: 550, width: 80, height: 30))
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        btn.setTitle("touch", for: .normal)
        btn.backgroundColor = UIColor.orange
        self.view.addSubview(btn)
        
        let turnBackBtn = UIButton.init(frame: CGRect(x: (self.view.frame.width-50)/2, y: 600, width: 80, height: 30))
        turnBackBtn.addTarget(self, action: #selector(btnRestore), for: .touchUpInside)
        turnBackBtn.setTitle("restore", for: .normal)
        turnBackBtn.backgroundColor = UIColor.orange
        self.view.addSubview(turnBackBtn)
    }
    
    @objc func btnAction(){
        decorateImageView.image = decorateImageView.image?.scaleTo(size: CGSize(width: 200, height: 200))
        //        decorateImageView.image = decorateImageView.image?.imageAtRect(rect: CGRect(x: 100, y: 100, width: 50, height: 50))
    }
    @objc func btnRestore(){
        decorateImageView.image = UIImage(named: "decorateImage")
    }

}
