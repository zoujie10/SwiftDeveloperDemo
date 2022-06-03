//
//  WW_ChartsVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/18.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import AAChartKit

class WW_ChartsVC: WW_MainBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "图表"
        // Do any additional setup after loading the view.
        configChartsView()
    }
    
	func configChartsView(){
		view.addSubview(mainTableView)
		mainTableView.snp.makeConstraints { make in
			make.edges.equalTo(view)
		}
//		let aaChart = WW_ThirdPart_AAChartKit.init()
//		aaChart.frame = CGRect(x: 0, y: self.view.bounds.height/2, width: WWScreenWidth, height: WWScreenHeight-self.view.bounds.height/2-64)
//		view.addSubview(aaChart)
		
	}
	lazy var mainTableView : UITableView = {
		let tb = UITableView.init(frame: .zero, style: .plain)
		tb.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
		tb.backgroundColor = .white
		tb.delegate = self
		tb.dataSource = self
		return tb
	}()
}
extension WW_ChartsVC:UITableViewDelegate,UITableViewDataSource{
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		if indexPath.row == 0{
			let chart = WW_ThirdPart_ChartsView.init()
			cell.contentView.addSubview(chart)
			chart.snp.makeConstraints { make in
				make.top.equalTo(cell.contentView).offset(10)
				make.left.right.equalTo(cell.contentView)
				make.height.equalTo(self.view.bounds.height/2)
			}
		}else if indexPath.row == 1{
			let aaChart = WW_ThirdPart_AAChartKit_BasicView.init()
			cell.contentView.addSubview(aaChart)
			aaChart.frame = CGRect(x: 0, y: 0, width: WWScreenWidth, height: WWScreenHeight-self.view.bounds.height/2)
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if indexPath.row == 0{
			return self.view.bounds.height/2+10
		}else if indexPath.row == 1{
			return WWScreenHeight-self.view.bounds.height/2+10
		}else{
			return 150
		}
	}
}
