//
//  SelectDesignPatternViewController.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 5/14/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class SelectDesignPatternViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSouce.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableview.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = (dataSouce[indexPath.row] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            //            self.present(DecorateViewController(), animated: false, completion: nil)
            self.navigationController?.pushViewController(DecorateViewController(), animated: true)
        }else if indexPath.row == 1{
            
        }else if indexPath.row == 2{
            self.navigationController?.pushViewController(ObserverPatternViewController(), animated: true)
        }
    }
    
    var tableview = UITableView()
    var dataSouce = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSouce = ["DecoratePattern","DelegatePattern","ObserverPattern"]
        tableview.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.view.frame.width, height: self.view.frame.height))
        tableview.delegate = self;
        tableview.dataSource = self;
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableview)
        
    }
}
