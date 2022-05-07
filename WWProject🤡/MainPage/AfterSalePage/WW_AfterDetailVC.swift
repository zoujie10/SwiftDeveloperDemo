//
//  WW_AfterDetailVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/6.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
enum CustomerDetail_Apply_Authorization_Letter_Type {
    case Apply_Authorization_Letter
    case Submitting_Data
    case Auditting
    case View_Data
    case Authorization_Passed
    case ToReceive_Contract
    case View_Authorization_Letter
    case Reject_Authorization_Letter
    case Reject_Submitting_Data
}
class WW_AfterDetailVC: WW_MainBaseVC {
    //head :"申请授权书说明:",
    let sectionOneData  = ["1. 需要下载纸质模版，签署后拍照上传至授权详情；",
                           "2. 盖章后扫描寄回公司；",
                           "3. 总部审核后上传授权书和合同电子版至后台；",
                           "4. 审核成功后可在旺铺下载查看"]
    let sectionTwoData = [" 选择产线"," 1"
                          ," 选择经销范围"," 3"
                          ," 请输入经销商名称","4 ",
                          " 请上传图片","6"]
    
    var totalData : NSArray = []
    var sectionTwoCellArray = [UITableViewCell.classForCoder()]
    var apply_authorization_letter_type:CustomerDetail_Apply_Authorization_Letter_Type = .Apply_Authorization_Letter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "录入"
        totalData = [sectionOneData,sectionTwoData]
        configCell()
        creatUI()
    }
    
    func creatUI(){
//        view.addSubview(self.changeImageBtn)
//        self.changeImageBtn.snp.makeConstraints { make in
//            make.center.equalTo(view)
//        }
        view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
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
    
    func configCell(){
        switch  apply_authorization_letter_type {
            case .Apply_Authorization_Letter:
                sectionTwoCellArray = [WW_AfterInfoTitleTextCell.classForCoder(),
                                      WW_LabelAndButtonCell.classForCoder(),
                                      WW_AfterInfoTitleTextCell.classForCoder(),
                                      WW_LabelAndButtonCell.classForCoder(),
                                      WW_AfterInfoTitleTextCell.classForCoder(),
                                      WW_OnlyTextFieldCell.classForCoder(),
                                       WW_AfterInfoTitleTextCell.classForCoder(),
                                       WW_AfterInfoPickImageCell.classForCoder()]
            case .View_Data:
                sectionTwoCellArray = [WW_AfterInfoTitleTextCell.classForCoder(),
                                      WW_AfterInfoOnlyBtnCell.classForCoder(),
                                      WW_AfterInfoTitleTextCell.classForCoder(),
                                      WW_AfterInfoPickImageCell.classForCoder()]
            case .Authorization_Passed:
                sectionTwoCellArray = [WW_AfterInfoTitleTextCell.classForCoder(),
                                      WW_LabelAndButtonCell.classForCoder(),
                                      WW_AfterInfoTitleTextCell.classForCoder(),
                                      WW_LabelAndButtonCell.classForCoder(),
                                      WW_OnlyTextFieldCell.classForCoder()]
            case .ToReceive_Contract,.View_Authorization_Letter,.Reject_Authorization_Letter,.Reject_Submitting_Data,.Submitting_Data,.Auditting:
                break
        }
        //section 1
        tableView.register(WW_AfterInfoTextCell.classForCoder(), forCellReuseIdentifier:NSStringFromClass(WW_AfterInfoTextCell.classForCoder()))
        //section 2
        for item in sectionTwoCellArray{
            tableView.register(item.class(), forCellReuseIdentifier: NSStringFromClass(item))
        }
    }
    
    //1.tableview
    //2. two section
    //3.  section 1  head + 4 text cells
    //4.  section 2  title cell ,btn cell,textfield cell,collectionview cell
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
        tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        return tableView
    }()
}

extension WW_AfterDetailVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WW_AfterInfoTextCell.classForCoder())) as! WW_AfterInfoTextCell
            cell.contentLabel.text = self.sectionOneData[indexPath.row]
            return cell
        }else{
            let classCell: AnyClass = self.sectionTwoCellArray[indexPath.row]
            if classCell is WW_AfterInfoTitleTextCell.Type{
                let cell : WW_AfterInfoTitleTextCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(classCell)) as! WW_AfterInfoTitleTextCell
                let string = NSMutableAttributedString(string: " * ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 13),NSAttributedString.Key.foregroundColor : UIColor(r: 252, g: 68, b: 84)])
                let subStr = NSAttributedString(string: self.sectionTwoData[indexPath.row])
                string.append(subStr)
                cell.titleLabel.attributedText = string
                return cell
            }else if classCell is WW_LabelAndButtonCell.Type{
                let cell : WW_LabelAndButtonCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(classCell)) as! WW_LabelAndButtonCell
                cell.contentLabel.text = self.sectionTwoData[indexPath.row]
                return cell
            }else if classCell is WW_OnlyTextFieldCell.Type{
                let cell : WW_OnlyTextFieldCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(classCell)) as! WW_OnlyTextFieldCell
                cell.mainTextField.placeholder = self.sectionTwoData[indexPath.row]
                return cell
            }else if classCell is WW_AfterInfoOnlyBtnCell.Type{
                let cell : WW_AfterInfoOnlyBtnCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(classCell)) as! WW_AfterInfoOnlyBtnCell
                return cell
            }else if classCell is WW_AfterInfoPickImageCell.Type{
                let cell : WW_AfterInfoPickImageCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(classCell)) as! WW_AfterInfoPickImageCell
                cell.nav = self.navigationController!
                return cell
            }else{
                let cell : WW_AfterInfoTitleTextCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(classCell)) as! WW_AfterInfoTitleTextCell
                return cell
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = totalData[section] as! NSArray
        return array.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0){
            return 35
        }else{
            let classCell: AnyClass = self.sectionTwoCellArray[indexPath.row]
            if classCell is WW_AfterInfoPickImageCell.Type{
                return 130
            }
            return 45
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init()
        label.text = "     申请授权书说明: "
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 45 : 0.1
    }
}
