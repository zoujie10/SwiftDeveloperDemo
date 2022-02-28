//
//  SwiftCAAnimationViewControllerThree.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/8.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
/*
 1.实现相关转场动画协议
 2.就是添加转场动画
 */
class SwiftCAAnimationViewControllerThree: WW_MainBaseVC,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        title = "自定义转场"
        self.navigationController!.delegate = self;//MARK:跳转导航代理
        creatUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.delegate = self;//MARK:跳转导航代理
    }
    func creatUI(){
        view.addSubview(transitionLayerBtn)
        transitionLayerBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 80, height: 80))
            make.right.equalTo(view).offset(-30)
            make.bottom.equalTo(view).offset(-30)
        }
    }
    
    @objc func popThreeBytransitionVC(){
        self.navigationController?.popViewController(animated: false)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop{
            let trans = WW_CircleTransition()
            trans.isPush = false
            return trans
        }else{
            return nil
        }
    }
    
    lazy var transitionLayerBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.black
        btn.layer.cornerRadius = 40
        btn.addTarget(self, action: #selector(popThreeBytransitionVC), for: .touchUpInside)
        return btn
    }()
}
