//
//  WW_MainBaseVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/6.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import Then

class WW_MainBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    override func viewWillAppear(_ animated: Bool) {
        configNavigationBar()
    }
 
    @available(iOS 13.0,*)
    func tabBar(){
        UITabBar.appearance().tintColor = UIColor(red: 245/255, green: 67/255, blue: 67/255, alpha: 1)//selectedColor
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1)//textColor
    }
    //NavBarleftItem
    func configNavigationBar(){
        if #available(iOS 14, *) {
            let app = UINavigationBarAppearance.init()
            app.configureWithOpaqueBackground()  // 重置背景和阴影颜色
            app.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            app.backgroundColor = UIColor(r:252,g:85,b:108,a:1) // 设置导航栏背景色
            app.shadowImage = UIColor.clear.image()  // 设置导航栏下边界分割线透明
//            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ww_navs_main_back_bar_btn_img_3")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain,target: self,action: #selector(pressBack))
            
            let button = UIButton.init()
            button.setImage(UIImage(named: "ww_navs_main_back_bar_btn_img_3")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
            button.addTarget(self, action: #selector(pressBack), for: .touchUpInside)
            button.setEnlargeEdge(5, 5, 5, 5)
            navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button)
            self.navigationController?.navigationBar.scrollEdgeAppearance = app  // 带scroll滑动的页面
            self.navigationController?.navigationBar.standardAppearance = app // 常规页面
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            let navBg = self.navigationController?.navigationBar.subviews.first
            navBg?.alpha = 1
        }
    }
    @objc func pressBack(){
        self.navigationController?.popViewController(animated: true)
    }
}
