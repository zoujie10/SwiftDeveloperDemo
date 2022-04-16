//
//  WW_CartInfoVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/6.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartInfoVC: WW_MainBaseVC {

    var viewModel = WW_CartInfoViewModel()
   
    override func viewDidLoad() {
        title = "购物车"
        view.backgroundColor  =  .white
        requestData()
        configUI()
    }
    func configUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: editBtnBtn)
        
        view.addSubview(refreshTableView)
        view.addSubview(calculateView)
        view.addSubview(deleteView)
        
        refreshTableView.snp.makeConstraints { make in
            make.left.top.right.equalTo(view);
            make.bottom.equalTo(view).offset(-45)
        }
        
        calculateView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(65)
        }
        
        deleteView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(65)
        }
    }
    func requestData(){
        self.viewModel.reloaCartInfo {
            self.refreshTableView.reloadData()
        } failureBlock: { msg in
            print(msg)
        }
    }
    @objc func changeNavItemStatus(item:UIButton){
        item.isSelected = !item.isSelected
        print(item.isSelected)
        changeCartEditStatus(isEdit: item.isSelected)
    }
    
    func changeCartEditStatus(isEdit:Bool){
        deleteView.isHidden = !isEdit
        calculateView.isHidden = isEdit
    }
    
    lazy var editBtnBtn : UIButton = {
        let editBtn = UIButton(type: .custom)
        editBtn.setTitle("编辑",for: .normal)
        editBtn.setTitle("完成",for: .selected)
        editBtn.setTitleColor(UIColor.white, for: .normal)
        editBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        editBtn.addTarget(self, action: #selector(changeNavItemStatus), for: .touchUpInside)
        return editBtn
    }()
    
    lazy var refreshTableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: CGFloat(WWScreenWidth), height: view.frame.size.height), style: .grouped)
        tableView.backgroundColor = UIColor(r: 246, g: 246, b: 246)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(WW_CartInvaildCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(WW_CartInvaildCell.classForCoder()))
        tableView.register(WW_CartNormalCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(WW_CartNormalCell.classForCoder()))
        tableView.register(WW_CartActivityCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(WW_CartActivityCell.classForCoder()))
        tableView.register(WW_CartSeckillCell.classForCoder(), forCellReuseIdentifier: NSStringFromClass(WW_CartSeckillCell.classForCoder()))
        tableView.register(WW_CartInvaildHeaderView.classForCoder(), forHeaderFooterViewReuseIdentifier: NSStringFromClass(WW_CartInvaildHeaderView.classForCoder()))
        return tableView
    }()
    
    lazy var deleteView : WW_CartBottomDeleteView = {
        let v = WW_CartBottomDeleteView()
        v.backgroundColor = UIColor.white
        v.isHidden = true
        v.select_Block = {
            
        }
        v.delete_Block = {
            
        }
        return v
    }()
    
    lazy var calculateView : WW_CartBottomCalculateView = {
        let v = WW_CartBottomCalculateView()
        v.backgroundColor = UIColor.white
        v.isHidden = false
        v.select_Block = {
            
        }
        v.calculate_Block = {
            
        }
        return v
    }()
    
}
extension WW_CartInfoVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getItemInSection(section: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.arrayAllDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType =  self.viewModel.getCellType(index: indexPath.section)
        let model : WW_ActivityModel = self.viewModel.arrayAllDatas[indexPath.section]
        let itemModel : WW_CartItem = model.cartItemList[indexPath.row]
        switch cellType {
            case .Cart_CellType_Normal:
                if indexPath.section == (self.viewModel.arrayAllDatas.count-1){
                    let cell : WW_CartInvaildCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WW_CartInvaildCell.classForCoder()), for: indexPath) as! WW_CartInvaildCell
                    
                    cell.configData(model: itemModel)
                    
                    return cell
                }else{
                    let cell : WW_CartNormalCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WW_CartNormalCell.classForCoder()), for: indexPath) as! WW_CartNormalCell
                    cell.configData(model: itemModel)
                    return cell
                }
            case .Cart_CellType_Activity:
                let cell : WW_CartActivityCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WW_CartActivityCell.classForCoder()), for: indexPath) as! WW_CartActivityCell
                cell.configData(model: itemModel)
                return cell
            case .Cart_CellType_SecondKill:
                let cell : WW_CartSeckillCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(WW_CartSeckillCell.classForCoder()), for: indexPath) as! WW_CartSeckillCell
                cell.configData(model: itemModel)
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cellType =  self.viewModel.getCellType(index: section)
        switch cellType {
            case .Cart_CellType_Normal:
                if section == (self.viewModel.arrayAllDatas.count-1){
                    let view = WW_CartInvaildHeaderView.init()
                    return view
                }
                return UIView.init()
            case .Cart_CellType_Activity:
                let view = WW_CartInvaildHeaderView.init()
                return view
            case .Cart_CellType_SecondKill:
                return UIView.init()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType =  self.viewModel.getCellType(index: indexPath.section)
        switch cellType {
            case .Cart_CellType_Normal:
                return 145
            case .Cart_CellType_Activity:
                return 145
            case .Cart_CellType_SecondKill:
                return 165
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellType =  self.viewModel.getCellType(index: section)
        switch cellType {
            case .Cart_CellType_Normal:
                if section == (self.viewModel.arrayAllDatas.count-1){
                    return 25
                }
                return 1
            case .Cart_CellType_Activity:
                return 25
            case .Cart_CellType_SecondKill:
                return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteRowAction = UIContextualAction.init(style: .destructive, title: "删除") {  _,_,_  in
            let model =  self.viewModel.arrayAllDatas[indexPath.section]
            model.cartItemList.remove(at: indexPath.row)
        }
        deleteRowAction.backgroundColor = .red
        let config = UISwipeActionsConfiguration.init(actions: [deleteRowAction])
        return config
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let model : WW_ActivityModel = self.viewModel.arrayAllDatas[indexPath.section]
        let itemModel : WW_CartItem = model.cartItemList[indexPath.row]
        return itemModel.isCanDelete ?? true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let model =  self.viewModel.arrayAllDatas[indexPath.section]
        model.cartItemList.remove(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
}

