//
//  SwiftGCDVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/21.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
//TODO
let ipUrl = "http://ip.taobao.com/service/getIpInfo.php?ip=27.156.152.57"

class SwiftGCDVC: UIViewController {
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "GCD"
        view.addSubview(label)
        label.text = "load......"
        label.textAlignment = .center
        label.backgroundColor = .orange
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.center.equalTo(view)
        }
        view.addSubview(self.gcdBtn)
        view.addSubview(self.gcdGroupBtn)
        self.gcdBtn.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
        }
        self.gcdGroupBtn.snp.makeConstraints { make in
            make.top.equalTo(self.gcdBtn.snp_bottom).offset(20)
            make.centerX.equalTo(view)
        }
        //1 查询IP
        
        //2 DisPatch Group
        
    }
    @objc func gcdIpMethod(){
        let globalQueue = DispatchQueue.global()
        let apiUrl = URL(string: ipUrl)
        
        globalQueue.async {
            let result = try? Data(contentsOf: apiUrl!)
            let message = String(data: result ?? Data.init(), encoding: String.Encoding.utf8)
            DispatchQueue.main.async {
                self.label.text = message
            }
        }
    }
    @objc func gcdGroupMethod(){
        let group = DispatchGroup()
        
        let globalQueue = DispatchQueue.global()
        
        globalQueue.async(group: group, execute: {
			Thread.sleep(forTimeInterval: 2)
            print("request step one")
        })
        
        globalQueue.async(group: group, execute: {
            print("request step two")
        })
        
        globalQueue.async(group: group, execute: {
            print("request step three")
        })
        
        group.notify(queue: globalQueue) {
            print("request complete!!!!")
        }
        
    }
    lazy var gcdBtn : UIButton = {
        let gcdBtn = UIButton()
        gcdBtn.setTitle("gcd IP", for: .normal)
        gcdBtn.setTitleColor(.black, for: .normal)
        gcdBtn.addTarget(self, action: #selector(gcdIpMethod), for: .touchUpInside)
        return gcdBtn
    }()
    
    lazy var gcdGroupBtn : UIButton = {
        let gcdGroupBtn = UIButton()
        gcdGroupBtn.setTitle("gcd Group", for: .normal)
        gcdGroupBtn.setTitleColor(.black, for: .normal)
        gcdGroupBtn.addTarget(self, action: #selector(gcdGroupMethod), for: .touchUpInside)
        return gcdGroupBtn
    }()
    
    
    func gcdMethodTest(){
        
        
    }
}
