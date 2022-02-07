//
//  SwiftTableViewEditVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/1.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
//单元格的选择和取消选择 系统的 ---- 最好的还是自定义 选择样式
//移动单元格的位置
class SwiftTableViewEditVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let cellID = "cellId"
    var sourceArray = Array<String>()
    
    typealias clickindexPathBlock = (IndexPath) -> Void
    var clickBlock : clickindexPathBlock?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(changeRightView))
        self.sourceArray = ["one",
                            "two",
                            "three",
                            "four",
                            "five",
                            "six",
                            "seven",
                            "eight",
                            "nine",]
        creatUI()
    }
    @objc func changeRightView(){
        self.tableView.isEditing =  !self.tableView.isEditing
    }
    
    func creatUI(){
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellID)!
        cell.textLabel?.text = self.sourceArray[indexPath.row]
        cell.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        cell.selectedBackgroundView?.backgroundColor = UIColor.white
        if(cell.isSelected){
            cell.textLabel?.textColor = UIColor.init(red: 247/255, green: 54/255, blue: 81/255, alpha: 1)
        }else{
            cell.textLabel?.textColor = UIColor.init(red: 133/255, green: 134/255, blue: 138/255, alpha: 1)
        }
        cell.selectionStyle = .default
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == .checkmark{
            cell?.accessoryType = .none
        }else{
            cell?.accessoryType = .checkmark
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
       //处理数据源
    }
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:self.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.isEditing = false
        tableView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)

        return tableView
    }()
}
