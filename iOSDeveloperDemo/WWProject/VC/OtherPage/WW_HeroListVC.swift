//
//  WW_HeroListVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/23.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import JXSegmentedView

class WW_HeroListVC: WW_JXSegmentContentBaseVC{
    var totalItemWidth: CGFloat = 0
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
        let bgView = UIView()
        bgView.backgroundColor = UIColor(r: 255, g: 255, b: 255, a: 0.8)
        self.backgroundImage.addSubview(bgView)
        //segmentedView.frame = CGRect(x: 80, y: 260, width: totalItemWidth, height: 40)
        bgView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(view).offset(265)
            make.bottom.equalTo(view)
        }
        totalItemWidth = UIScreen.main.bounds.size.width - 80*2
        let titles = ["总监英雄榜", "名言堂"]
        let titleDataSource = JXSegmentedTitleDataSource()
        titleDataSource.itemWidth = totalItemWidth/CGFloat(titles.count)
        titleDataSource.titles = titles
        titleDataSource.isTitleMaskEnabled = true
        titleDataSource.titleNormalColor = .white
        titleDataSource.titleSelectedColor = .red
        titleDataSource.itemSpacing = 0
        segmentedDataSource = titleDataSource
        
        segmentedView.dataSource = titleDataSource
        segmentedView.layer.masksToBounds = true
        segmentedView.layer.cornerRadius = 20
//        segmentedView.layer.borderColor = UIColor.red.cgColor
//        segmentedView.layer.borderWidth = 1/UIScreen.main.scale
        segmentedView.backgroundColor = UIColor(r: 255, g: 255, b: 255, a: 0.2)
//        segmentedView.backgroundColor = .orange
        let indicator = JXSegmentedIndicatorBackgroundView()
        indicator.indicatorHeight = 40
        indicator.indicatorWidthIncrement = 0
        indicator.indicatorColor = UIColor.white
        segmentedView.indicators = [indicator]
      
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        segmentedView.frame = CGRect(x: 80, y: 275, width: totalItemWidth, height: 40)
        view.bringSubview(toFront: segmentedView)
        view.bringSubview(toFront: listContainerView)
    }
}

