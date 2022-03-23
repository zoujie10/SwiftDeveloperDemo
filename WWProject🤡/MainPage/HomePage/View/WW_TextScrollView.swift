//
//  WW_TextScrollView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/22.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
//1 tableview
//2 text cell
//3 定时器滚动

class WW_TextScrollviewCell : UITableViewCell{
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func creatUI(){
        contentView.addSubview(keyTextLabel)
        keyTextLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    lazy var keyTextLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label;
    }()
}

class WW_TextScrollView: UIView {
    
    var dataSource = [String]()
    
    typealias clickindexPathBlock = (String) -> Void
    var clickindex_block : clickindexPathBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
        RunLoop.main.add(timer, forMode: .commonModes)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func creatUI(){
        self.addSubview(scrollTableView)
//        scrollTableView.snp.makeConstraints { make in
//            make.edges.equalTo(self)
////            make.edges.equalTo(UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0))
//        }
        scrollTableView.frame = CGRect(x: 45, y: 0, width: 150, height: 35)
    }
    
    @objc func timeMethod(){
        if scrollTableView.contentOffset.y >= CGFloat(35*self.dataSource.count-1){
            scrollTableView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        }else{
            scrollTableView.setContentOffset(CGPoint(x: 0, y: self.scrollTableView.contentOffset.y + 35), animated: true)
        }
    }
    lazy var scrollTableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(WW_TextScrollviewCell.classForCoder(), forCellReuseIdentifier:"cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    lazy var timer : Timer = {
        let t = Timer.init(timeInterval: 1, target: self, selector: #selector(timeMethod), userInfo: AnyObject.self, repeats: true)
//        RunLoop.main.add(t, forMode: .commonModes)
        return t
    }()
}

extension WW_TextScrollView: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count * 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WW_TextScrollviewCell
        let idx =  indexPath.row % self.dataSource.count
        cell.keyTextLabel.text = self.dataSource[idx]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idx =  indexPath.row % self.dataSource.count
        if self.clickindex_block != nil{
            self.clickindex_block!(self.dataSource[idx])
        }
        print(self.dataSource[idx])
    }
}
