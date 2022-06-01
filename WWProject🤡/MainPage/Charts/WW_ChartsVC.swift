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
		let chart = WW_ThirdPart_ChartsView.init()
		view.addSubview(chart)
		chart.snp.makeConstraints { make in
			make.top.equalTo(self.view).offset(15)
			make.left.right.equalTo(self.view)
			make.height.equalTo(self.view.bounds.height/2-64)
		}
		
		let aaChart = WW_ThirdPart_AAChartKit.init()
		aaChart.frame = CGRect(x: 0, y: self.view.bounds.height/2, width: WWScreenWidth, height: WWScreenHeight-self.view.bounds.height/2-64)
		view.addSubview(aaChart)
		
	}
}
