//
//  WW_ShareActionVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/3.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
//TODO
//1.长图
//2.背景
//3.保存图片
class WW_ShareActionVC: WW_MainBaseVC {
    let cellID = "cellID"
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Share"
        configUI()
    }
    func configUI(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_ShareImaggViewCell.classForCoder(), forCellReuseIdentifier:self.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0)
        return tableView
    }()

}

extension WW_ShareActionVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : WW_ShareImaggViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellID) as! WW_ShareImaggViewCell
        cell.itemImageView.image = UIImage(named: "fruiticons_buttons_lemon")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        let imageView = UIImageView.init()
        imageView.image = UIImage(named: "fruiticons_buttons_lemon")
//        imageView.kf.setImage(with: URL.init(string: "filePath"))
//        imageView.kf.indicatorType = .activity
        return CGFloat(WWScreenWidth * (imageView.image?.size.height)! / (imageView.image?.size.width)!)
    }
}
