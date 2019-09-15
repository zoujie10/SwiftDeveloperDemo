//
//  MyAnnotation.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/9/15.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: NSObject,MKAnnotation {
	var coordinate: CLLocationCoordinate2D//地理坐标
	
	var streetAddress : String!
	var city : String!
	var state : String!
	var zip : String!
	
	init(coordinate: CLLocationCoordinate2D) {
		self.coordinate = coordinate
	}
	
	var title: String?{
		return "您的位置"
	}
	
	var subtitle: String?{
		var res = NSMutableString()
		if(self.state != nil){
			res.appendFormat("%@", self.state)
		}
		
		if(self.city != nil){
			res.appendFormat("%@", self.city)
		}
		if(self.streetAddress != nil){
			res.appendFormat("%@", self.streetAddress)
		}
		if(self.zip != nil){
			res.appendFormat("%@", self.zip)
		}
		return res as String
	}
	
	
}
