//
//  WW_BaseTabBarVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/25.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_BaseTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        
        let homeVC = HomeVC()
        addChildViewController(homeVC,
                               title: "首页",
                               image: UIImage(named: "ww_tab_bars_home_default_img"),
                               selectedImage: UIImage(named: "ww_tab_bars_home_selected_img"))
        
        //WW_MainBaseVC
        let wwVC = WW_MainVC()
        addChildViewController(wwVC,
                               title: "WW",
                               image: UIImage(named: "ww_tab_bars_mine_default_img"),
                               selectedImage: UIImage(named: "ww_tab_bars_mine_selected_img"))
        //MineViewController
        let mineVC = MineViewController()
        addChildViewController(mineVC,
                               title: "Baisc",
                               image: UIImage(named: "ww_tab_bars_ceo_default_img"),
                               selectedImage: UIImage(named: "ww_tab_bars_ceo_selected_img"))
        //TextViewController
//        let otherVC = TextViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)//获取storyboard的vc
        let vc = storyboard.instantiateViewController(withIdentifier: "stroryboardVC")
        addChildViewController(vc,
                               title: "StoryBoard",
                               image: UIImage(named: "ww_tab_bars_cart_default_img"),
                               selectedImage: UIImage(named: "ww_tab_bars_cart_selected_img"))
        
    }
    func addChildViewController(_ childController: UIViewController, title:String?, image:UIImage? ,selectedImage:UIImage?) {
        
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: title,
                                                  image: image?.withRenderingMode(.alwaysOriginal),
                                                  selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -6, right: 0)
        }
        addChildViewController(WW_BaseNavVC(rootViewController: childController))
    }
}
extension WW_BaseTabBarVC {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else { return .lightContent }
        return select.preferredStatusBarStyle
    }
}
