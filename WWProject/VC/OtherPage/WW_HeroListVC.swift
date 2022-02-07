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

        title = "榜单推荐"
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        configUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        let app = UINavigationBarAppearance.init()
        app.configureWithOpaqueBackground()  // 重置背景和阴影颜色
        app.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ww_navs_main_back_bar_btn_img_3")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain,target: self,action: #selector(pressBack))
        let navBg = self.navigationController?.navigationBar.subviews.first
        if #available(iOS 15, *) {
            navBg?.alpha = 0//设置导航栏背景透明
        }
        self.navigationController!.navigationBar.standardAppearance = app // 常规页面
    }
    
    @objc override func pressBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func configUI(){
        self.backgroundImage.image = UIImage(named: "ww_heroList_backimage")
        view.addSubview(self.backgroundImage)
        self.backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        let subImageView = UIImageView()
        subImageView.image = UIImage(named: "ww_heroList_subBackimage")
//        subImageView.layer.cornerRadius = 8
        self.backgroundImage.addSubview(subImageView)
        //segmentedView.frame = CGRect(x: 80, y: 260, width: totalItemWidth, height: 40)
        subImageView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(view).offset(245)
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

