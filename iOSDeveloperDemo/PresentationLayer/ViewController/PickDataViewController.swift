//
//  PickDataViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/14.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class PickDataViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
	//MARK:PickView ~~~~~~~~~~
	var pickData : NSMutableDictionary! = NSMutableDictionary()//全部数据
	var pickProvincesData : NSMutableArray! = NSMutableArray()//省份
	var pickCitiesData : NSMutableArray! = NSMutableArray()//省所对应的市
	
	@IBOutlet var pickerView: UIPickerView!
	@IBOutlet var displayAddressLB: UILabel!
	@IBAction func clickAddressBtn(_ sender: UIButton) {
		let row0 = self.pickerView.selectedRow(inComponent: 0)
		let row1 = self.pickerView.selectedRow(inComponent: 1)
		let selected1 = self.pickProvincesData[row0] as! String
		let selected2 = self.pickCitiesData[row1] as! String
		let title = NSString(format: "%@,%@市", selected1,selected2)
		displayAddressLB.text = title as String
	}
	
	
	//MARK:  DatePickView~~~~~~~~~~~~~~~~~
	@IBOutlet var datePickView: UIDatePicker!
	@IBOutlet var displayDateLB: UILabel!
	@IBAction func pickDateAction(_ sender: UIButton) {
		let theDate : NSDate = self.datePickView.date as NSDate
		let desc = theDate.description(with: NSLocale.current)
		print(desc)
		
		let dateFormatter : DateFormatter = DateFormatter()
		dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
		print(dateFormatter.string(from: theDate as Date))
		self.displayDateLB.text = dateFormatter.string(from: theDate as Date)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		let pistPath = Bundle.main.path(forResource: "China_cities", ofType: "plist")
		let dataA:NSArray = NSArray(contentsOfFile:pistPath!)!//all data
		let allCities : NSMutableArray = NSMutableArray()
		for model in dataA{ //model 是数组里的元素遍历  不是索引
			let dataSingel = model //单一的省市数据
			let dicP = (dataSingel as! NSDictionary) .object(forKey: "name")as! NSString
			self.pickProvincesData.add(dicP) //省的数组
			allCities.add((dataSingel as AnyObject) .object(forKey: "cities") as! NSArray)//市的数组
			
			let cities  = (dataSingel as AnyObject) .object(forKey: "cities") as! NSArray
			self.pickData .setObject(cities, forKey: dicP)
		}
		self.pickCitiesData = allCities.firstObject as? NSMutableArray
		self.pickerView.delegate = self
		self.pickerView.dataSource = self
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	//MARK:delegate
	func numberOfComponents(in pickerView: UIPickerView) -> Int {//选择器拨轮的数目
		return 2 //省  市
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		if component == 0 {
			return self.pickProvincesData.count
		}else{
			return self.pickCitiesData.count
		}
	}
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		if component == 0{
			return self.pickProvincesData[row] as? String
		}else{
			return self.pickCitiesData[row] as? String
		}
	}
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		if component == 0{
			let seleedProvince : String = self.pickProvincesData[row] as! String
			self.pickCitiesData = self.pickData[seleedProvince] as! NSMutableArray//省对应的市数据
			self.pickerView.reloadComponent(1)
		}
	}
}
