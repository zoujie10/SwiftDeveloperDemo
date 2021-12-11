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
        // Do any additional setup after loading the view.
        ww_initNavBar()
        ww_creatNav()
    }
    //NavBar
    func ww_initNavBar(){
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-300, 0), for: .default)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1)], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor(red: 245/255, green: 67/255, blue: 67/255, alpha: 1)], for: .selected)
        
        tabBar()
    }
    @available(iOS 13.0,*)
    func tabBar(){
        UITabBar.appearance().tintColor = UIColor(red: 245/255, green: 67/255, blue: 67/255, alpha: 1)//selectedColor
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1)//textColor
    }
    //NavBarleftItem
    func ww_creatNav(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "ww_navs_main_back_bar_btn_img_3"), style: .plain, target: self, action: #selector(click_back))
    }
    @objc func click_back(){
        self.navigationController?.popViewController(animated: true)
    }
}
