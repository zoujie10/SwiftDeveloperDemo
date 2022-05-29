//
//  WW_ThirdPart_AAChartKit.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/27.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import AAChartKit

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
	var aaChartModel: AAChartModel?
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

	func drawChart(){//TODO
		setupAAChartView()
		let chartType = configureTheChartType()
		setupAAChartView(with: chartType)
		aaChartView.aa_drawChart(with: aaChartModel!)
	}
	func setupAAChartView(){
		//TODO
	}
	func setupAAChartView(with chartType:AAChartType){
		
	}
	func setupChartViewEventHandlers(){
		self.addSubview(self.aaChartView)
		self.aaChartView.snp.makeConstraints { make in
			make.edges.equalTo(self)
		}
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
}
