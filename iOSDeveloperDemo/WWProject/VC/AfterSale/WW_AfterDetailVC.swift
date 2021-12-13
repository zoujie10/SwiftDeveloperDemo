//
//  WW_AfterDetailVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/6.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_AfterDetailVC: WW_MainBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "售后详情"
        view.addSubview(self.changeImageBtn)
        self.changeImageBtn.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        // Do any additional setup after loading the view.
    }
    
    lazy var changeImageBtn : UIButton = {
        let changeImageBtn = UIButton()
        changeImageBtn.setTitle("展示示例", for: .normal)
        changeImageBtn.setTitleColor(.black, for: .normal)
        changeImageBtn.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
        return changeImageBtn
    }()
    @objc func changeImage(){
        let vc = WWAfterSaleDisplayPicEgVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.clickBlock = {
            print("block 回调")
        }
        self.present(vc, animated: false, completion: nil)
    }
}
