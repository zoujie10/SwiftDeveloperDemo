//
//  WW_FamousSayingVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/23.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import JXSegmentedView

class WW_FamousSayingVC: WW_MainBaseVC{
    var vcTitle : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = self.vcTitle
    }

    func creatUI(){
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_HeroListFamousSayingCell.classForCoder(), forCellReuseIdentifier:"cellID")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        return tableView
    }()

}
extension WW_FamousSayingVC : JXSegmentedListContainerViewListDelegate, UITableViewDelegate,UITableViewDataSource{
   
    func listWillAppear() {
        print(self.vcTitle)
    }
    
    func listView() -> UIView {
        return self.view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! WW_HeroListFamousSayingCell
        cell.famousSayingLabel.text = "世上本没有路，走的人多了便有了路。"
        cell.nameLabel.text = "周树人（浙江/绍兴）"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
