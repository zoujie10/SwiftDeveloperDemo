//
//  UIViewControllerVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/4/11.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class UIViewControllerVC: WW_MainBaseVC,UIScrollViewDelegate {
    private var _orientations = UIInterfaceOrientationMask.portrait
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    get { return self._orientations }
    set { self._orientations = newValue }
    }
    let pageCtr = UIPageControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "UIViewController"
//         1.UIViewController
        VC_ForScrollView()
        VC_Content()
        VC_Rotation()
        //MARK:     2.UITabBarController
//        VC_TabbarController()
        //MARK:  3.UINavigationController
//        VC_Navgation()
 
    }
    //MARK:BEGIN --- VC_Content
    func VC_Content(){
        //1.UI Dispaly by Code or storyBoard
        //2.jump by nav push or ModelPresent
        //3.UIAppearance 统一修改外观样式 eg：更换app主题
        UIButton.appearance().setTitle("title", for:.normal)
        //4.UIPopoverPresentationController 气泡框
        makePopUI()
    }
    func VC_Rotation(){
        let btn = UIButton()
        btn.setTitle("rotation", for: UIControlState.normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(rotationMethod), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp_top).offset(100);
            make.width.height.equalTo(100)
        }
       

    }
    @objc func rotationMethod(){
        if(self.supportedInterfaceOrientations == .portrait){
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
            self._orientations = UIInterfaceOrientationMask.landscapeLeft
        }else{
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            self._orientations = UIInterfaceOrientationMask.portrait
        }
    }
    
  
    func makePopUI(){
        let btn = UIButton()
        btn.setTitle("Pop", for: UIControlState.normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(popMethod), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.center.equalTo(self.view).offset(100)
            make.width.height.equalTo(100)
        }
    }
    
    @objc func popMethod(btn:UIButton){
        let popView = UIViewController()
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController?.delegate = self;
        popView.popoverPresentationController?.sourceView = btn
        popView.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: 0, width: 90 , height: 150)
        popView.popoverPresentationController?.permittedArrowDirections = .any;
        popView.popoverPresentationController?.backgroundColor = .orange
//        popView.popoverPresentationController?.popoverBackgroundViewClass
//        popView.isModalInPopover = true
//        popView.isModalInPresentation = true
        popView.popoverPresentationController?.canOverlapSourceViewRect = false;
        let subView = UIView()
        subView.backgroundColor = .red
        popView.view.addSubview(subView)
        subView.snp.makeConstraints {
            $0.center.equalTo(popView.view)
            $0.width.height.equalTo(30)
        }
        self.present(popView, animated: true) {
        
        }
    }
    //POP View 必须实现的代理
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func VC_ForScrollView(){
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = .cyan
        self.view.addSubview(scrollView);
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        scrollView.contentSize = CGSize.init(width: self.view.frame.width, height: self.view.frame.height*4)
        scrollView.delegate = self
        pageCtr.backgroundColor = .white
        pageCtr.currentPageIndicatorTintColor = .black
        pageCtr.pageIndicatorTintColor = .red
        
        pageCtr.numberOfPages = 4
        self.view.addSubview(pageCtr)
        pageCtr.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.center.equalTo(self.view)
            
        }
    }
    //生命周期
    override func viewWillAppear(_ animated: Bool) {// Called when the view is about to made visible. Default does nothing
        super.viewWillAppear(animated)
        self.navigationItem.prompt = "正在载入..." //导航栏变为74
    }
    override func viewDidAppear(_ animated: Bool) {// Called when the view has been fully transitioned onto the screen. Default does nothing

        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {// Called when the view is dismissed, covered or otherwise hidden. Default does nothing
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {// Called after the view was dismissed, covered or otherwise hidden. Default does nothing
        super.viewDidDisappear(animated)
    }
    override func viewWillLayoutSubviews(){//即将布局子视图

    }

    override func viewDidLayoutSubviews(){//子视图布局完成

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y <= 50){
            pageCtr.currentPage = 1
        }else if(scrollView.contentOffset.y > 50 && scrollView.contentOffset.y < 150){
            pageCtr.currentPage = 2
        }else if( scrollView.contentOffset.y < 200 && scrollView.contentOffset.y > 150){
            pageCtr.currentPage = 3
        }else{
            pageCtr.currentPage = 4;
        }
    }
    
    //MARK:UITabbarController
    func VC_TabbarController(){
    let tabBar =  UITabBarController()
        tabBar.selectedIndex = 0
//        tabBar.tabBar.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)//Top
        let navArr = NSMutableArray()
        let arrayVC = [HomeVC.self,SwiftBasicViewController.self,SwiftAdvanceViewController.self]
        for vc in arrayVC {
            let nav = UINavigationController.init(rootViewController: vc.init())
//            nav.tabBarItem.title = vc.title
//            nav.tabBarItem.image = vc.image
//            nav.tabBarItem.selectedImage = vc.selectImage
            if(vc.isMember(of: HomeVC.self)){
                nav.tabBarItem.badgeValue = "100"
                nav.tabBarItem.badgeColor = .red
            }
            navArr.add(nav)
        }
        tabBar.viewControllers = navArr as? [UIViewController]

    }
    
    //MARK: NavigationViewController
    func VC_Navgation(){
        
//        let nav = UINavigationController.init(rootViewController: HomeVC.init())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Jump", style: .plain, target: self, action: #selector(JumpNextPage))
        self.navigationController?.setToolbarHidden(true, animated: false)
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    @objc func JumpNextPage(){
        
    }
}

extension UIViewControllerVC :UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate{
   
}
