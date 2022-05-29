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
	var aaChartView: AAChartView?
	var chartType: BasicChartVCChartType?
	var receivedChartType: String?
	
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
		aaChartView?.aa_drawChart(with: aaChartModel!)
	}
	func setupAAChartView(){
		//TODO
	}
	func setupAAChartView(with chartType:AAChartType){
		
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
