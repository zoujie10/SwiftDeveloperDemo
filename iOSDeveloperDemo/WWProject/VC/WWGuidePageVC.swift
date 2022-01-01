//
//  WWGuidePageVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/23.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
//引导页
class WWGuidePageVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        // Do any additional setup after loading the view.
        makeUI()
    }
    func makeUI(){
        let imageView = UIImageView()
        imageView.image = UIImage(named: "罗丹-思想者")
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        UIView.animate(withDuration: 1) {
            self.view.alpha = 0.5;
        } completion:{_ in
            let main : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = main.instantiateInitialViewController()//根视图
            UIApplication.shared.windows.first?.rootViewController = vc
        }
    }
}
