//
//  WW_ThirdPart_AAChartKit_PieView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/6/3.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import AAChartKit

class WW_ThirdPart_AAChartKit_PieView: UIView {

	var aaChartModel: AAChartModel = AAChartModel()
	lazy var aaChartView : AAChartView = {
		let chart = AAChartView.init()
		//禁用 AAChartView 滚动效果
		//设置 AAChartView 的背景色是否为透明
		chart.scrollEnabled = false
		chart.isClearBackgroundColor = false
		//解开注释(同时需要注释掉 block 方法),
//		chart.delegate = self
		return chart
	}()
	
	required init?(coder: NSCoder) {
		
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	
//		self.backgroundColor = UIColor.colorWithHex(withHex: 0x4b2b7f, alpha: 1)
		self.backgroundColor = .white
		drawChart()
	}
	func drawChart(){//TODO
		setupAAChartView()
		configurePieChart()
		aaChartView.aa_drawChart(with: aaChartModel)
	}
	func configurePieChart(){
		aaChartModel = AAChartModel()
			.chartTypeSet()(AAChartTypePie)!
			.colorsThemeSet()(["#0c9674","#7dffc0","#ff3333","#facd32","#ffffa0","#EA007B"])!
			.dataLabelsEnabledSet()(false)!//是否直接显示扇形图数据
			.yAxisTitleSet()("元")!
			.legendEnabledSet()(false)!//是否显示图例 lengend(图表底部可点按的圆点和文字)
			.seriesSet()([AASeriesElement()
							.nameSet()("金币收益明细")!
							.innerSizeSet()("60%")!//内部圆环半径大小占比
							.sizeSet()(150)!//图的大小
							.borderWidthSet()(0)!
							.allowPointSelectSet()(false)!//是否允许在点击数据点标记(扇形图点击选中的块发生位移)
							.statesSet()(AAStates().hoverSet()(AAHover.init().enabledSet()(false)))!//禁用点击区块之后出现的半透明遮罩层
							.dataSet()([["Firefox",3336.2],
										["IE", 26.8],
										["sliced": false,
										 "selected": true,
										 "name": "Chrome",
										 "y": 666.8],
										["Safari",      88.5],
										["Opera",       46.0],
										["Others",     223.0]]) as Any])!
	}

	func setupAAChartView(){
		self.addSubview(self.aaChartView)
		self.aaChartView.snp.makeConstraints { make in
//			make.edges.equalTo(self)
			make.left.equalTo(self).offset(10)
			make.top.bottom.equalTo(self)
			make.width.equalTo(160)
		}
		
		let centerlabel = UILabel.init()
		centerlabel.text = "$909.00"
		centerlabel.textAlignment = .center
		centerlabel.textColor = .black
		self.aaChartView.addSubview(centerlabel)
		centerlabel.snp.makeConstraints { make in
			make.center.equalTo(self.aaChartView)
		}
		
		let rightLabel = UILabel.init()
		rightLabel.text = "* 试吃  ￥909.00  75%"
		rightLabel.font = UIFont.boldSystemFont(ofSize: 12)
		rightLabel.textAlignment = .right
		rightLabel.textColor = .blue
		self.addSubview(rightLabel)
		rightLabel.snp.makeConstraints { make in
			make.top.equalTo(self).offset(20)
			make.right.equalTo(self).offset(-30)
			make.left.equalTo(self.aaChartView.snp_right).offset(20)
			make.height.equalTo(25)
		}
		setupChartViewEventHandlers()
	}
	func setupChartViewEventHandlers(){
		//获取图表加载完成事件
		aaChartView.didFinishLoadHandler { chatView in
			print("🚀🚀🚀🚀 AAChartView content did finish load!!!")
		}
		
		aaChartView.clickEventHandler { aaChartView, message in
			let messageDic = [
//				"category": message?.category as Any,
				"index": NSNumber(value: message!.index),
				"name": message!.name,
				"offset": message!.offset,
				"x": message!.x,
				"y": message!.y
			] as [String : Any]

			let str1 = "🖱🖱🖱🖱 clicked point series element name: \(message!.name ?? "")\n"
			let str2 = "user finger clicked!!!,get the click event BLOCK message: \(messageDic)"
			
			print(str1,str2)
		}
		//获取图表上的手指点击及滑动事件
		aaChartView.moveOverEventHandler { aaChartView, message in
			let messageDic = [
//				"category": message?.category as Any,
				"index": NSNumber(value: message!.index),
				"name": message!.name,
				"offset": message!.offset,
				"x": message!.x,
				"y": message!.y
			] as [String : Any]

			let str1 = "👌👌👌👌 move over point series element name:\(message!.name ?? "")\n"
			let str2 = "user finger moved over!!!,get the move over event BLOCK \(messageDic)"
			
			print(str1,str2)
		}
	}
}
