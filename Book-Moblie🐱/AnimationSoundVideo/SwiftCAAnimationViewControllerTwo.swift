//
//  SwiftCAAnimationViewControllerTwo.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/8.
//  Copyright © 2022 Zoujie. All rights reserved.
//

//侧边栏动画效果： 1.弹出膜层 2.弹层边缘弹簧效果 3.弹层内部空间弹簧效果
import UIKit

class SwiftCAAnimationViewControllerTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "侧滑栏/点赞"
        view.backgroundColor = UIColor.white
        creatUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.delegate = self;//MARK:跳转导航代理
    }
    func creatUI(){

        self.view.addSubview(self.sortBtn)
        self.sortBtn.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        self.view.addSubview(self.animationLayerBtn)
        self.animationLayerBtn.snp.makeConstraints { make in
            make.top.equalTo(self.sortBtn.snp_bottom).offset(70)
            make.centerX.equalTo(self.sortBtn)
        }
        
        let cubeView = SwiftCubeDisplayView()
        self.view.addSubview(cubeView)
        cubeView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.height.equalTo(100)
            make.bottom.equalTo(self.sortBtn.snp_top).offset(-100)
        }
        
        view.addSubview(transitionLayerBtn)
        transitionLayerBtn.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 80, height: 80))
            make.right.equalTo(view).offset(-30)
            make.bottom.equalTo(view).offset(-30)
        }
    }
    
    @objc func jumpVC(){
        let vc = SwiftSelectAndSortVC()
        vc.showVC()
    }
    @objc func jumpAnimationVC(){
        let mune =  SwiftSlideAnimationMuneView.init(stringTitles:["1","2","3","4"])
        mune.switchAction()
    }
    
    @objc func jumpThreeBytransitionVC(){
        let vc = SwiftCAAnimationViewControllerThree()
        self.navigationController?.pushViewController(vc, animated: true)//MARK:要走代理动画 必须打开
    }
    
    lazy var sortBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("弹层", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(jumpVC), for: .touchUpInside)
        return btn
    }()

    lazy var animationLayerBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("动画layer弹层", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(jumpAnimationVC), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var transitionLayerBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.black
        btn.layer.cornerRadius = 40
        btn.addTarget(self, action: #selector(jumpThreeBytransitionVC), for: .touchUpInside)
        return btn
    }()
    
}
extension SwiftCAAnimationViewControllerTwo:UINavigationControllerDelegate{
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push{
            let trans = WW_CircleTransition()
            trans.isPush = true
            return trans
        }else{
            return nil
        }
    }
}
