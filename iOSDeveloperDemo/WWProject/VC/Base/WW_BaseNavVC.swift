//
//  WW_BaseNavVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/25.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_BaseNavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let interactionGes = interactivePopGestureRecognizer else { return }
        guard let targetView = interactionGes.view else { return }
        guard let internalTargets = interactionGes.value(forKeyPath: "targets") as? [NSObject] else { return }
        guard let internalTarget = internalTargets.first?.value(forKey: "target") else { return }
        let action = Selector(("handleNavigationTransition:"))

        let fullScreenGesture = UIPanGestureRecognizer(target: internalTarget, action: action)
        fullScreenGesture.delegate = self
        targetView.addGestureRecognizer(fullScreenGesture)
        interactionGes.isEnabled = false
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 { viewController.hidesBottomBarWhenPushed = true }
        super.pushViewController(viewController, animated: animated)
    }
}


extension WW_BaseNavVC : UIGestureRecognizerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
        guard let ges = gestureRecognizer as? UIPanGestureRecognizer else { return true }
        if ges.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1 : -1) <= 0
            || disablePopGesture {
            return false
        }
        return viewControllers.count != 1;
    }
}

extension WW_BaseNavVC {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let topVC = topViewController else { return .lightContent }
        return topVC.preferredStatusBarStyle
    }
}


enum WW_NavigationBarStyle {
    case theme
    case clear
    case white
}

extension WW_BaseNavVC {
    
    private struct AssociatedKeys {
        static var disablePopGesture: Void?
    }
    
    var disablePopGesture: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disablePopGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func barStyle(_ style: WW_NavigationBarStyle) {
        switch style {
        case .theme:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
        case .clear:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        case .white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIColor.white.image(), for: .default)
            navigationBar.shadowImage = nil
        }
        if #available(iOS 15, *) {
            let app = UINavigationBarAppearance.init()
            app.configureWithOpaqueBackground()  // 重置背景和阴影颜色
            app.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            app.backgroundColor = UIColor(r:252,g:85,b:108,a:1) // 设置导航栏背景色
            app.shadowImage = UIColor.clear.image()  // 设置导航栏下边界分割线透明
            navigationBar.scrollEdgeAppearance = app  // 带scroll滑动的页面
            navigationBar.standardAppearance = app // 常规页面
          
        }
    }
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
}
