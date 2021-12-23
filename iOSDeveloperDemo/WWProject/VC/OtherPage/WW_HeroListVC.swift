//
//  WW_HeroListVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/23.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import JXSegmentedView

class WW_HeroListVC: WW_MainBaseVC{

   
    let backgroundImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "英雄榜"
        view.backgroundColor = .white
    
        // Do any additional setup after loading the view.
        configUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        //设置导航栏背景透明
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(),for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func configUI(){
        self.backgroundImage.image = UIImage(named: "ww_heroList_backimage")
        view.addSubview(self.backgroundImage)
        self.backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
//        let segmentedView = SegmentedControl()
//        segmentedView.delegate = self
//        self.view.addSubview(self.segmentedView)
    }

}
