//
//  ZJ_SortAlgorithmVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/30.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class ZJ_SortAlgorithmVC: WW_MainBaseVC {

    let cellID = "cellID"
    let sortNameArray = ["Bubbling Sort","Select Sort","Insert Sort","Stock Sort","Merge Sort","Quick Sort"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Algorithm"
        let algorithm = ZJ_Bubbling_Algorithm.init()
        algorithm.Sort_Bubbling()
        algorithm.Sort_Bubbling_OutSide_optimize()
        let choose = ZJ_Choose_Sorted_Algorithm.init()
        choose.chooseSorted_Algorithm()
    }
    

    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:self.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        
        return tableView
    }()
}
extension ZJ_SortAlgorithmVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)!
        cell.largeContentTitle = sortNameArray[indexPath.row]
        return cell
    }
    
    
}
