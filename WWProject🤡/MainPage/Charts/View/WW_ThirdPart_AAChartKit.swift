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
		self.chartType = .bar
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
		aaChartModel.categoriesSet()(["Java", "Swift", "Python", "Ruby", "PHP", "Go","C", "C#", "C++", "Perl", "R", "MATLAB", "SQL"])!//设置 X 轴坐标文字内容
		.animationTypeSet()(AAChartAnimation.easeOutCubic)!//图形的渲染动画类型为 EaseOutCubic
		.animationDurationSet()(1200)//图形渲染动画时长为1200毫秒
	}
	/**
	 *   图表 Y 轴标示线的设置
	 *   标示线设置作为图表一项基础功能,用于对图表的基本数据水平均线进行标注
	 *   虽然不太常被使用,但我们仍然提供了此功能的完整接口,以便于有特殊需求的用户使用
	 *   解除👆上面的设置 Y 轴标注线的已被注释代码,,运行程序,即可查看实际工程效果以酌情选择
	 *
	 **/
	func configureTheYAxisPlotLineForAAChartView(){/*配置 Y 轴标注线,解开注释,即可查看添加标注线之后的图表效果(NOTE:必须设置 Y 轴可见)*/
		aaChartModel.yAxisPlotLinesSet()
		([AAPlotLinesElement.init()
			.colorSet()("#F05353")!
			.dashStyleSet()(AAChartLineDashStyleTypeLongDashDot)!
			.widthSet()(1)!
			.valueSet()(20)!
			.zIndexSet()(5)!
			.labelSet()(AALabel()
							.textSet()("PlotLines Element One")!
							.styleSet()(AAStyleColor("#F05353")))!,
		  AAPlotLinesElement.init()
			  .colorSet()("#33BDFD")!
			  .dashStyleSet()(AAChartLineDashStyleTypeLongDashDot)!
			  .widthSet()(1)!
			  .valueSet()(40)!
			  .zIndexSet()(5)!
			  .labelSet()(AALabel()
							  .textSet()("PlotLines Element Two")!
							  .styleSet()(AAStyleColor("#33BDFD")))!,
		  AAPlotLinesElement.init()
			  .colorSet()("#ADFF2F")!
			  .dashStyleSet()(AAChartLineDashStyleTypeLongDashDot)!
			  .widthSet()(1)!
			  .valueSet()(60)!
			  .zIndexSet()(5)!
			  .labelSet()(AALabel()
							  .textSet()("PlotLines Element Three")!
							  .styleSet()(AAStyleColor("#ADFF2F")))!
			])
			
	}
	
}
extension WW_ThirdPart_AAChartKit:AAChartViewEventDelegate{
	func aaChartViewDidFinishLoad(_ aaChartView: AAChartView!) {
		
	}
	
	func aaChartView(_ aaChartView: AAChartView!, clickEventWithMessage message: AAClickEventMessageModel!) {
		
	}
	
	func aaChartView(_ aaChartView: AAChartView!, moveOverEventWithMessage message: AAMoveOverEventMessageModel!) {
		
	}
}
