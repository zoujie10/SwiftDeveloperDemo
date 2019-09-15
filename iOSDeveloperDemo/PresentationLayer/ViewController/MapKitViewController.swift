//
//  MapKitViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/9/14.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapKitViewController: UIViewController,MKMapViewDelegate {

	@IBOutlet var txtQueryKey: UITextField!
	@IBOutlet var ConfirmBtn: UIButton!
	@IBOutlet weak var mapView: MKMapView!
	
	var locationManger : CLLocationManager!
	override func viewDidLoad() {
        super.viewDidLoad()
		
		if CLLocationManager.locationServicesEnabled(){
			mapView.mapType = .standard //地图类型 常用标准，卫星，混合
			mapView.delegate = self
			mapView.userTrackingMode = .follow//开启跟踪用户位置
			mapView.showsUserLocation = true
			self.locationManger = CLLocationManager()
			self.locationManger.requestWhenInUseAuthorization()
			self.locationManger.requestAlwaysAuthorization()
		}
    }
    
	func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
		NSLog("error : %@", error.localizedDescription)
	}

	@IBAction func geocodeQuery(_ sender: UIButton) {
		if self.txtQueryKey.text == nil {
			return
		}
		
		let geocoder = CLGeocoder()
		geocoder.geocodeAddressString(self.txtQueryKey.text!,completionHandler: {(placeMarks, error) -> Void in
			if placeMarks!.count > 0{//防止反复点击 刷新多个标注
				self.mapView.removeAnnotations(self.mapView.annotations)
			}
			
			for item in placeMarks!{
				let placemark = item as CLPlacemark
				//调整地图位置和缩放比例
				let viewRegion = MKCoordinateRegionMakeWithDistance(placemark.location!.coordinate, 10000, 10000)//指定区域中心点，目标区域南北的跨度，目标区域东西的跨度
				self.mapView.setRegion(viewRegion, animated: true)//设置地图显示区域
				
				let annotation = MyAnnotation(coordinate: placemark.location!.coordinate)
				annotation.city = placemark.locality
				annotation.state = placemark.administrativeArea
				annotation.streetAddress = placemark.thoroughfare
				annotation.zip = placemark.postalCode
				self.mapView.addAnnotation(annotation)
			}
		})
		
		self.txtQueryKey.resignFirstResponder()
	}
	
	//MARK:添加i标注回调
	func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
		
		var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "PIN_ANNOTATION") as? MKPinAnnotationView
		if(annotationView == nil){
			annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PIN_ANNOTATION")
		}
		
		annotationView?.pinTintColor = MKPinAnnotationView.purplePinColor()
		annotationView?.animatesDrop = true
		annotationView?.canShowCallout = true
		
		return annotationView!
	}
	
	func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
		let _ = userLocation.location
		self.mapView.centerCoordinate = userLocation.location!.coordinate
	}
}
