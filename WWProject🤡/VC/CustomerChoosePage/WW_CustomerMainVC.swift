//
//  WW_CustomerMainVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/24.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CustomerMainVC: WW_MainBaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "客户管理"
        view.backgroundColor = UIColor.white
        creatUI()
      
    }
    
    func creatUI(){
    
        view.addSubview(sortBtn)
        sortBtn.snp.makeConstraints { make in
            make.top.equalTo(view.snp_top).offset(100)
            make.centerX.equalTo(view)
        }
        
    }
    
    @objc func jumpVC(){
//        WW_CustomerFiltrateTypeVC
    }
    
    lazy var sortBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("弹层", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(jumpVC), for: .touchUpInside)
        return btn
    }()
}
