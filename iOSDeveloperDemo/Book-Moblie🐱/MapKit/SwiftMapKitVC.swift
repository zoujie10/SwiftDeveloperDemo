//
//  SwiftMapKitVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/19.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import MapKit

class SwiftMapKitVC: UIViewController,MKMapViewDelegate {
    
    var myMapKit = MKMapView()
    var selectedAnnotion : MKAnnotation!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //MapKit
        //1.MKMapView显示区域
        studyMKMapViewregion()
        //2.MKMapView的跟踪和定位
        //3.MKMapView的交互选项和装饰物
        //4.创建一个MKMapView地图
        //5.MKMapView的代理和使用
        //6.自定义animationView和calloutView
        //7.Camera相机的使用
    }
    
    func studyMKMapViewregion(){
        //region属性用来设置地图的显示区域
        //span定义了以center属性为中心点，显示在MapView中的地图缩放程度
       
        //向下移动屏幕高度的一般
//        let coordinate = self.myMapKit.convert(CGPoint(x: myMapKit.frame.width/2, y: 0), toCoordinateFrom: myMapKit)
//        myMapKit.setCenter(coordinate, animated: true)
        
        //显示区域放大两倍
        self.myMapKit.region.span.latitudeDelta *= 1.5
        self.myMapKit.region.span.longitudeDelta *= 1.5
        
//        self.myMapKit.isZoomEnabled = true;   // 是否缩放
//        self.myMapKit.isScrollEnabled = true; // 是否滚动
//        self.myMapKit.isRotateEnabled = true; // 是否旋转
//        self.myMapKit.isPitchEnabled = false; // 是否显示3DVIEW
        // 是否显示指南针（iOS9.0）
        self.myMapKit.showsCompass = true;
        // 是否显示比例尺（iOS9.0）
        self.myMapKit.showsScale = true;
        // 是否显示交通（iOS9.0）
        self.myMapKit.showsTraffic = true;
        // 是否显示建筑物
        self.myMapKit.showsBuildings = true;
        // 显示兴趣点
//        self.myMapKit.showsPointsOfInterest = true
        
        self.myMapKit.mapType = .standard
        self.myMapKit.delegate = self
        self.myMapKit.userTrackingMode = .followWithHeading
        self.myMapKit.showsUserLocation = true
       
        view.addSubview(self.myMapKit)
        self.myMapKit.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

        let coordinate2D = CLLocationCoordinate2D(latitude: 31.221470143954, longitude: 121.52341614996)
        let zoomLevel = 0.02
        let region = MKCoordinateRegionMake(coordinate2D, MKCoordinateSpanMake(zoomLevel, zoomLevel))
        self.myMapKit.setRegion(region, animated: true)
        
        //camera
        let fromEye = CLLocationCoordinate2D(latitude: 31.221470143954+0, longitude: 121.52341614996+0)//视角位置
        let altitude : CLLocationDistance = 200 //视角高度
        let camera = MKMapCamera(lookingAtCenter: coordinate2D, fromEyeCoordinate: fromEye, eyeAltitude: altitude)
        self.myMapKit.camera = camera
        
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = coordinate2D
        objectAnnotation.title = "Home"
        objectAnnotation.subtitle = "小破房"
        self.myMapKit.addAnnotation(objectAnnotation)
        


    }
    //监听地区区域变化
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
    }
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        
    }
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//        print("mapViewDidChangeVisibleRegion")
    }
    
    //监听数据变化
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("mapViewWillStartLoadingMap")
    }
    

    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("mapViewDidFinishLoadingMap")
    }
    
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        
    }
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "annotation View"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        let button = UIButton(type: .infoDark)
        button.addTarget(self, action: #selector(showInfo), for: .touchUpInside)
        annotationView?.leftCalloutAccessoryView = button
        annotationView?.image = UIImage(named: "Expression_1")
        
        self.selectedAnnotion = annotation
        annotationView?.canShowCallout = true //弹出标注视图
        return annotationView
    }
    //添加和点击事件
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        for view in views{
            print("注解视图的标题是：\(String(describing: view.annotation?.title))")
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title as Any,view.annotation?.subtitle as Any,view.annotation?.coordinate as Any)
    }
    
    @objc func showInfo(){
        let message = "此处为住处"
        let alertView = UIAlertController(title: self.selectedAnnotion.title!, message: message, preferredStyle: .alert)
        let OK = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alertView.addAction(OK)
        self.present(alertView, animated: true, completion: nil)
    }
}
