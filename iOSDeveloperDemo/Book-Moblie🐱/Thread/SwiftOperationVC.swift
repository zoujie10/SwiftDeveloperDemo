//
//  SwiftOperationVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/21.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
let topImageUrl = "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ML7P3_VW_PF+watch-41-alum-green-nc-7s_VW_PF_WF_CO?wid=1400&hei=1400&trim=1,0&fmt=p-jpg&qlt=95&.v=1629920392000,1631661146000"
let downImageUrl = "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ML7P3_VW_34FR+watch-41-alum-green-nc-7s_VW_34FR_WF_CO?wid=1400&hei=1400&trim=1,0&fmt=p-jpg&qlt=95&.v=1629920380000,1631661141000"

class SwiftOperationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Operation"
        // Do any additional setup after loading the view.
        view.addSubview(self.topImageView)
        view.addSubview(self.downImageView)
        self.topImageView.snp.makeConstraints { make in
            make.left.right.top.equalTo(view)
            make.height.equalTo(350)
        }
        self.downImageView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(self.topImageView.snp_bottom)
        }
        
        operationMethod()
    }
    
    func operationMethod(){
        let topImage = BlockOperation {
            self.downloadImageMethod(path:topImageUrl,isTop: true)
        }

        let downImage = BlockOperation{
            self.downloadImageMethod(path:downImageUrl,isTop: false)
        }
        
        let queue =  OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.addOperation(topImage)
        queue.addOperation(downImage)
    }

    func downloadImageMethod(path:String,isTop:Bool){
     
        let url = URL(string: path)
        var data : Data!
        do {
            try data = Data(contentsOf: url!)
            let image = UIImage(data: data)
            if isTop {
                self.performSelector(onMainThread: #selector(SwiftOperationVC.showTopImage), with: image, waitUntilDone: true)
            }else{
                self.performSelector(onMainThread: #selector(SwiftOperationVC.showDownImage), with: image, waitUntilDone: true)
            }
        }catch{
            print("down load pic fail!!!!!")
        }
    }
    
    @objc func showTopImage(image:UIImage){
        self.topImageView.image = image
    }
    
    @objc func showDownImage(image:UIImage){
        self.downImageView.image = image
    }

    lazy var topImageView : UIImageView = {
        let topImageView = UIImageView()
//        animationImageView.image = UIImage(named: "cornel_branch_tree")
        return topImageView
    }()
    
    lazy var downImageView : UIImageView = {
        let downImageView = UIImageView()
//        animationImageView.image = UIImage(named: "cornel_branch_tree")
        return downImageView
    }()

}
