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
        let insert = ZJ_Insert_Sort_Algorithm()
        insert.insert_Sort()
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
        tableView.register(WW_AfterInfoTitleTextCell.classForCoder(), forCellReuseIdentifier:self.cellID)
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
        let cell : WW_AfterInfoTitleTextCell = tableView.dequeueReusableCell(withIdentifier: cellID) as! WW_AfterInfoTitleTextCell
     
        cell.titleLabel.text = sortNameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 5{
            let algorithm = ZJ_Quick_Sort_Algorithm.init()
            let array = algorithm.quick_sort_Algorithm(array: [12,14,19,14,15,12,123,1234,33])
            print(array)
            
            let classB = binary_Search()
            classB.binary_search_method(array: [1,2,3,4,5,6,7,8,9,10], num: 11)
            
            let classSum = SumTwoNum.init()
            print(classSum.twoSum([2,5,5,11], 10))
            
            let classSum2 = Solution.init()
//            print(classSum2.addTwoNumbers([9,9,9,9,9,9,9], [9,9,9,9]))
            print(classSum2.addTwoNumbers([2,4,3], [5,6,4]))
        }
    }
}
