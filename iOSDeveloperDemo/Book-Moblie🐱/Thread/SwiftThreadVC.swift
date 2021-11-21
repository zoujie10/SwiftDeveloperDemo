//
//  SwiftThreadVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/20.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
//图片地址  苹果官网 https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone13pro-digitalmat-gallery-1-202111?wid=728&hei=666&fmt=png-alpha&.v=1635487436000
let strPicUrl = "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone13pro-digitalmat-gallery-1-202111?wid=728&hei=666&fmt=png-alpha&.v=1635487436000"

class SwiftThreadVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "线程"
        //1.使用Thread

        //2.Operation
        
        //3.GCD Grand central dispatch
        
        UIConfig()
    }
    
    func UIConfig(){
        view.addSubview(self.threadBtn)
        view.addSubview(self.threadLockBtn)
        view.addSubview(self.threadNoLockBtn)
        view.addSubview(self.operationBtn)
        view.addSubview(self.gcdBtn)
        view.addSubview(self.animationImageView)
        
        self.threadBtn.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
        }
        self.threadLockBtn.snp.makeConstraints { make in
            make.top.equalTo(self.threadBtn.snp_bottom).offset(20)
            make.left.equalTo(0)
            make.width.equalTo(view.frame.size.width/2)
        }
        self.threadNoLockBtn.snp.makeConstraints { make in
            make.top.equalTo(self.threadBtn.snp_bottom).offset(20)
            make.right.equalTo(view.snp_right)
            make.left.equalTo(self.threadLockBtn.snp_right)
        }
        
        self.operationBtn.snp.makeConstraints { make in
            make.top.equalTo(self.threadLockBtn.snp_bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        self.gcdBtn.snp.makeConstraints { make in
            make.top.equalTo(self.operationBtn.snp_bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        self.animationImageView.snp.makeConstraints { make in
            make.top.equalTo(self.gcdBtn.snp_bottom).offset(20)
            make.left.right.bottom.equalTo(view)
        }
    }
    
    @objc func threadImageMethod(){
        //显示创建
//        Thread.detachNewThreadSelector(<#T##selector: Selector##Selector#>, toTarget: <#T##Any#>, with: <#T##Any?#>)
//        Thread.init(target: <#T##Any#>, selector: <#T##Selector#>, object: <#T##Any?#>)
        //隐式创建
//        let object = NSObject()
//        object.performSelector(inBackground: <#T##Selector#>, with: <#T##Any?#>)
        
        let thread = Thread.init(target: self, selector: #selector(SwiftThreadVC.downLoadImage), object: strPicUrl)
        thread.start()
    }
    
    @objc func downLoadImage(path:String){
        let url = URL(string: path)
        var data : Data!
        do {
            try data = Data(contentsOf: url!)
            let image = UIImage(data: data)
            self.performSelector(onMainThread: #selector(SwiftThreadVC.showImage), with: image, waitUntilDone: true)
        }catch{
            print("down load pic fail!!!!!")
        }
    }
    @objc func showImage(image : UIImage){
        self.animationImageView.image = image
    }
    
    var bookCount = 100
    var sellBookCount = 0
    var lock = NSLock()
    
    @objc func threadLockMethod(){
        
        let sellOne = Thread(target: self, selector: #selector(sellBooks), object: nil)
        sellOne.name = "SellOne"
        sellOne.start()
        
        let sellTwo = Thread(target: self, selector: #selector(sellBooks), object: nil)
        sellTwo.name = "SellTwo"
        sellTwo.start()
        
        let sellThree = Thread(target: self, selector: #selector(sellBooks), object: nil)
        sellThree.name = "SellThree"
        sellThree.start()
    }
    
    @objc func sellBooks(){
        while true {
            lock.lock()//注释 锁 观察有所和无锁效果
            if bookCount > 0{
                Thread.sleep(forTimeInterval: 0.01)
                sellBookCount += 1
                bookCount -= 1
                let threadName = Thread.current.name
                
                print("当前销售员\(String(describing: threadName)),此书已销售\(sellBookCount),此书还剩余\(bookCount)")
            }else{
                Thread.exit()
            }
            lock.unlock()
        }
        
    }
    @objc func threadNoLockMethod(){
        let sellOne = Thread(target: self, selector: #selector(sellnoLockBooks), object: nil)
        sellOne.name = "SellOne"
        sellOne.start()
        
        let sellTwo = Thread(target: self, selector: #selector(sellnoLockBooks), object: nil)
        sellTwo.name = "SellTwo"
        sellTwo.start()
        
        let sellThree = Thread(target: self, selector: #selector(sellnoLockBooks), object: nil)
        sellThree.name = "SellThree"
        sellThree.start()
    }
    @objc func sellnoLockBooks(){
        while true {
//            lock.lock()//注释 锁 观察有所和无锁效果
            if bookCount > 0{
                Thread.sleep(forTimeInterval: 0.01)
                sellBookCount += 1
                bookCount -= 1
                let threadName = Thread.current.name
                
                print("当前销售员\(String(describing: threadName)),此书已销售\(sellBookCount),此书还剩余\(bookCount)")
            }else{
                Thread.exit()
            }
//            lock.unlock()
        }
        
    }
    @objc func operationMethod(){
        self.navigationController?.pushViewController(SwiftOperationVC(), animated: true)
    }
    
    @objc func gcdIMethod(){
        self.navigationController?.pushViewController(SwiftGCDVC(), animated: true)
    }
    
    lazy var animationImageView : UIImageView = {
        let animationImageView = UIImageView()
        animationImageView.image = UIImage(named: "cornel_branch_tree")
        return animationImageView
    }()
    lazy var threadBtn : UIButton = {
        let threadBtn = UIButton()
        threadBtn.setTitle("NSThread 下载图片", for: .normal)
        threadBtn.setTitleColor(.black, for: .normal)
        threadBtn.addTarget(self, action: #selector(threadImageMethod), for: .touchUpInside)
        return threadBtn
    }()
    
    lazy var threadLockBtn : UIButton = {
        let threadBtn = UIButton()
        threadBtn.setTitle("NSThread 有锁", for: .normal)
        threadBtn.setTitleColor(.black, for: .normal)
        threadBtn.addTarget(self, action: #selector(threadLockMethod), for: .touchUpInside)
        return threadBtn
    }()
    
    lazy var threadNoLockBtn : UIButton = {
        let threadNoLockBtn = UIButton()
        threadNoLockBtn.setTitle("NSThread 无锁", for: .normal)
        threadNoLockBtn.setTitleColor(.black, for: .normal)
        threadNoLockBtn.addTarget(self, action: #selector(threadNoLockMethod), for: .touchUpInside)
        return threadNoLockBtn
    }()
    
    lazy var operationBtn : UIButton = {
        let operationBtn = UIButton()
        operationBtn.setTitle("operation 图片", for: .normal)
        operationBtn.setTitleColor(.black, for: .normal)
        operationBtn.addTarget(self, action: #selector(operationMethod), for: .touchUpInside)
        return operationBtn
    }()
    
    lazy var gcdBtn : UIButton = {
        let gcdBtn = UIButton()
        gcdBtn.setTitle("gcd 图片", for: .normal)
        gcdBtn.setTitleColor(.black, for: .normal)
        gcdBtn.addTarget(self, action: #selector(gcdIMethod), for: .touchUpInside)
        return gcdBtn
    }()
}
