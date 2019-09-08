//
//  LocationAndMapViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/7/27.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
import CoreLocation //1.导入模块
import AddressBook
class LocationAndMapViewController: UIViewController,CLLocationManagerDelegate {//2.声明协议
	var currLocation = CLLocation()
	@IBOutlet var txtlng: UITextField!
	
	@IBOutlet var txtLat: UITextField!
	
	
	@IBOutlet var txtAlt: UITextField!
	
	@IBOutlet var addressInfo: UILabel!
	
	@IBOutlet var searchKeyWords: UITextField!
	
	
	@IBOutlet var Lat: UILabel!
	
	@IBOutlet var lng: UILabel!
	
	@IBOutlet var address: UILabel!
	var locationManager:CLLocationManager!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        //相关类
//		CLLocationManager   用于定位服务管理类能够提供位置信息和高度信息，也可以监控设备进入或离开某个区域，还可以获取设备的运行方向等。
//		CLLocationManagerDelegate  CLLocationManager类的委托协议
//		CLLocation 封装了位置和高度信息
		
		//地理信息反编码  地标类
//		CLPlacemark
		//实现地理坐标与地理文字描述信息之间的转换
//		CLGeocoder
		self.locationManager = CLLocationManager()
		self.locationManager.delegate = self
		self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
		self.locationManager.distanceFilter = 1000.0 //距离过滤，定义设备移动后获得位置信息的最小距离
		
		self.locationManager.requestWhenInUseAuthorization()//用户授权
		self.locationManager.requestAlwaysAuthorization()
		
    }
    
	override func viewWillAppear(_ animated: Bool) {
		self.locationManager.startUpdatingLocation()
	}
	override func viewWillDisappear(_ animated: Bool) {
		self.locationManager.stopUpdatingLocation()
	}
	
	//MARK:delegate
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		let currLocation = locations.last
		self.currLocation = locations.last!
		self.txtLat.text = NSString(format: "%3.5f", (currLocation?.coordinate.latitude)!) as String
		self.txtlng.text = NSString(format: "%3.5f", (currLocation?.coordinate.longitude)!) as String
		self.txtAlt.text = NSString(format: "%3.5f", (currLocation?.altitude)!) as String
		print("%3.5f",currLocation?.coordinate.latitude as Any)
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("error %@",error.localizedDescription)
	}
	
	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		if(status == CLAuthorizationStatus.authorizedAlways){
			NSLog("%@","authorizedAlways")
		}else if(status == CLAuthorizationStatus.authorizedWhenInUse){
			NSLog("%@","authorizedWhenInUse")
		}else if(status == CLAuthorizationStatus.denied){
			NSLog("%@","denied")
		}else if(status == CLAuthorizationStatus.restricted){
			NSLog("%@","restricted")
		}else if(status == CLAuthorizationStatus.notDetermined){
			NSLog("%@","notDetermined")
		}
	}
	
	
	@IBAction func reverIndo(_ sender: UIButton) {
		let geocoder = CLGeocoder()
		geocoder.reverseGeocodeLocation(self.currLocation,completionHandler:{(placemarks, error) -> Void in
			if placemarks!.count > 0{
				let placemark = placemarks![0] as CLPlacemark
//				let addressDictionary = placemark.addressDictionary
				let address = placemark.thoroughfare
				let country = placemark.country
				let city = placemark.locality
				self.addressInfo.text = NSString(format: "%@-%@-%@", country!,city!,address!) as String
			}
		})
		
	}
	
	@IBAction func EnquiryAction(_ sender: UIButton) {
		if self.searchKeyWords.text == nil {
			return
		}
		
		let geocoder = CLGeocoder()
		geocoder.geocodeAddressString(self.searchKeyWords.text!,completionHandler: {(placeMarks, error) -> Void in
			if placeMarks!.count > 0{
//				NSLog("查询记录数 i%", placeMarks?.count ?? NSInteger.self)
				
				let placemark = placeMarks![0] as CLPlacemark
//				let addressDic = plaemark.addressDictionary
//				var address : String
//				if ((placemark.thoroughfare) != nil) {
//					address = placemark.thoroughfare!
//				}
				
				let  city = placemark.locality as NSString?
			
				let location = placemark.location?.coordinate
				
				self.Lat.text = NSString(format: "%3.5f", location!.latitude) as String
				self.lng.text = NSString(format: "%3.5f", location!.longitude) as String
				
				self.address.text = city as String?
			}
		})
		
		self.searchKeyWords.resignFirstResponder()
		
		//指定范围查询
//		let region = CLCircularRegion(center: self.currLocation.coordinate, radius: 500, identifier: "GeocodeRegion")
//		geocoder.geocodeAddressString(self.searchKeyWords.text!, in: region,completionHandler: { (placemarks, error) -> Void in
//
//		})
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.searchKeyWords.resignFirstResponder()
	}
}
