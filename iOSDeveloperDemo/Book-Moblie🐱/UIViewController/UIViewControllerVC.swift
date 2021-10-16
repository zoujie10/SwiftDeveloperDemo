//
//  UIViewControllerVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/4/11.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class UIViewControllerVC: UIViewController,UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate,UIScrollViewDelegate {
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
        
        //MARK:  3.UINavigationController

 
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
        popView.popoverPresentationController?.sourceRect = CGRect.init(x: 0, y: 0, width: 100, height: 100)
        popView.popoverPresentationController?.permittedArrowDirections = .any;
        popView.popoverPresentationController?.backgroundColor = .orange;
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
    override func viewWillLayoutSubviews(){
        
    }

    override func viewDidLayoutSubviews(){
        
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
    
    //MARK: NavigationViewController
    
    
    //MARK:UITabbarController
}
