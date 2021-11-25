//
//  WWGuidePageVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/23.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

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
        self.view.isHidden = true
        
        let main : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = main.instantiateInitialViewController()
        UIApplication.shared.windows.first?.rootViewController = vc
    }
}
