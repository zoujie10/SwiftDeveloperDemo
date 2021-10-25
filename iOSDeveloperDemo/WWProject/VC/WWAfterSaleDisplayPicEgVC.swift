//
//  WWAfterSaleDisplayPicEgVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/20.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WWAfterSaleDisplayPicEgVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    typealias clickBtnBlock = () -> Void
    var clickBlock : clickBtnBlock?
    
    let cellId = "CellId"

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.picArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! WWAfterSalePicEgCell
        cell.picImageView.image = self.picArray[indexPath.row] as? UIImage
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        showView()
    }
    func showView(){
        self.view.addSubview(self.operateView)
        self.operateView.addSubview(self.picTableView)
        self.operateView.addSubview(self.knowBtn)
       
        self.operateView.snp.makeConstraints {
            $0.center.equalTo(self.view)
            $0.height.equalTo(self.view.frame.size.height-170)
//            $0.left.equalTo(self.view).offset(35)
//            $0.right.equalTo(self.view).offset(-35)
            $0.width.equalTo(340)
        }
        
        self.picTableView.snp.makeConstraints {
            $0.top.equalTo(self.operateView.snp_top).offset(20)
            $0.bottom.equalTo(self.operateView.snp_bottom).offset(-20)
//            $0.left.equalTo(self.operateView).offset(20)
//            $0.right.equalTo(self.operateView).offset(-20)
            $0.width.equalTo(280)
            $0.centerX.equalTo(self.operateView)
        }
        
        self.knowBtn.snp.makeConstraints {
            $0.bottom.equalTo(self.operateView).offset(-15);
            $0.centerX.equalTo(self.operateView)
            $0.width.equalTo(160)
        }
    }
 
    @objc func knowMethod(){
        self.dismiss(animated: false, completion: nil)
        self.clickBlock?()    
    }
    
    lazy var picTableView : UITableView = {
        let picTabelView = UITableView.init(frame: CGRect.zero, style: .plain)
        picTabelView.register(WWAfterSalePicEgCell.classForCoder(), forCellReuseIdentifier:cellId)
        picTabelView.delegate = self
        picTabelView.dataSource = self
        picTabelView.showsVerticalScrollIndicator = false
        picTabelView.separatorStyle = .none
        return picTabelView
    }()
    
    lazy var knowBtn : UIButton = {
       let knowBtn = UIButton()
        knowBtn.backgroundColor = UIColor.init(red: 252/255, green: 85/255, blue: 108/255, alpha: 1)
        knowBtn.setTitle("知道了", for: .normal)
        knowBtn.setTitleColor(UIColor.white, for: .normal)
        knowBtn.titleLabel?.font = .boldSystemFont(ofSize: 16)
        knowBtn.layer.cornerRadius = 16
        knowBtn.layer.opacity = 1
        knowBtn.layer.shadowOpacity = 0.3
        knowBtn.layer.shadowOffset = CGSize.init(width: 0, height: 5)
        knowBtn.layer.shadowColor = UIColor.red.cgColor
        knowBtn.layer.shadowRadius = 5
        knowBtn.addTarget(self, action: #selector(knowMethod), for: .touchUpInside)
        return knowBtn
    }()
    
    lazy var operateView : UIView = {
       let operateView = UIView()
        operateView.backgroundColor = .white
        operateView.layer.cornerRadius = 8
        operateView.clipsToBounds = true
        return operateView
    }()
    
    lazy var picArray : NSArray = {
        let picArray = [UIImage.init(named: "WWAfter_Pic_1_1"),
                        UIImage.init(named: "WWAfter_Pic_2_1"),
                        UIImage.init(named: "WWAfter_Pic_3_1"),
                        UIImage.init(named: "WWAfter_Pic_4_1")]
        return picArray as NSArray
    }()
}
