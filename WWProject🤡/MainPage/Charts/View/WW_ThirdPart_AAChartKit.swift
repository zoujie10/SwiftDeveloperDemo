//
//  WW_ThirdPart_AAChartKit.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/27.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import AAChartKit
import CarPlay

class WW_ThirdPart_AAChartKit: UIView {
	enum BasicChartVCChartType : Int {
		case column = 0
		case bar
		case area
		case areaspline
		case line
		case spline
		case stepLine
		case stepArea
		case scatter
	}
	var aaChartModel: AAChartModel = AAChartModel()
	var chartType: BasicChartVCChartType?
	var receivedChartType: String?
	
	lazy var aaChartView : AAChartView = {
		let chart = AAChartView.init()
		//禁用 AAChartView 滚动效果
		//设置 AAChartView 的背景色是否为透明
		chart.scrollEnabled = false
		chart.isClearBackgroundColor = false
		return chart
	}()
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	
		self.backgroundColor = UIColor.colorWithHex(withHex: 0x4b2b7f, alpha: 1)
		drawChart()
	}
	func configureTheChartType() -> AAChartType {
		switch chartType {
			case .column:
				return AAChartTypeColumn as AAChartType
			case .bar:
				return AAChartTypeBar as AAChartType
			case .area:
				return AAChartTypeArea as AAChartType
			case .areaspline:
				return AAChartTypeAreaspline as AAChartType
			case .line:
				return AAChartTypeLine as AAChartType
			case .spline:
				return AAChartTypeSpline as AAChartType
			case .stepLine:
				return AAChartTypeLine as AAChartType
			case .stepArea:
				return AAChartTypeArea as AAChartType
			case .scatter:
				return AAChartTypeScatter as AAChartType
			default:
				break
		}
		return ""
	}
	func drawChart(){//TODO
		setupAAChartView()
		let chartType = configureTheChartType()
		setupAAChartView(with: chartType)
		aaChartView.aa_drawChart(with: aaChartModel)
	}
	func setupAAChartView(){
		self.addSubview(self.aaChartView)
		self.aaChartView.snp.makeConstraints { make in
			make.edges.equalTo(self)
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
				"category": message!.category,
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
				"category": message!.category,
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
	func setupAAChartView(with chartType:AAChartType){

		aaChartModel.chartTypeSet()("")!
			.colorsThemeSet()(["#fe117c", "#ffc069", "#06caf4", "#7dffc0"])!
			.tooltipValueSuffixSet()("℃")!
			.yAxisLineWidthSet()(0)!
			.yAxisGridLineStyleSet()(AALineStyle(width: 0))!
			.seriesSet()([AASeriesElement()
							.nameSet()("2017")?
							.dataSet()([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])as Any,
						  AASeriesElement()
							.nameSet()("2018")?
							.dataSet()([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])as Any,
						  AASeriesElement()
							.nameSet()("2019")?
							.dataSet()([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])as Any,
						  AASeriesElement()
							.nameSet()("2020")?
							.dataSet()([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]) as Any])
		
		configureTheStyleForDifferentTypeChart()//为不同类型图表设置样式
		configureTheYAxisPlotLineForAAChartView()/*配置 Y 轴标注线,解开注释,即可查看添加标注线之后的图表效果(NOTE:必须设置 Y 轴可见)*/
		
	}
	
	
	
	func configureTheStyleForDifferentTypeChart(){//为不同类型图表设置样式
		
	}
	func configureTheYAxisPlotLineForAAChartView(){/*配置 Y 轴标注线,解开注释,即可查看添加标注线之后的图表效果(NOTE:必须设置 Y 轴可见)*/
		
	}
}
