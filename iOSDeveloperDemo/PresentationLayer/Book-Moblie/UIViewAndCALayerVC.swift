//
//  UIViewAndCALayerVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/4/11.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class UIViewAndCALayerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		//视图UIView
//		NSObject ->
//		UIResponder ->
//		UIView -> UIWindow,UILabel,UIButton,UIPickerView,UIProgressView,UIScrollView,UITableView,UICollectionView,UIActivityIndicatorView,UIImageView,UISearchBar,UINavigationBar,UIPageControl,UISwitch,UISlider,UIDatePicker,UISegmentedControl,UITextView,UITextField
		
		//1.1UIView外观属性
		let view = UIView()
		view.backgroundColor = UIColor.orange
		view.alpha = 0.9
		view.isHidden = false
		view.clipsToBounds = false //限制子视图的显示范围不超过父视图的显示区域
		view.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
		self.view.addSubview(view)
		
		//1.2UIView几何属性
		//了解坐标系  UIKit X轴正方向向右 → Y轴正方向向下 “↓”  Quartz 2D绘图 X轴正方向向右 → Y轴正方向向上 “↑”
		let view1 = UIView()
		view1.frame = CGRect.init(x: 10, y: 10, width: 50, height: 50)
//		view1.transform3D
		
		//1.3UIView嵌套层次关系  层次管理方法
		view.addSubview(view1)
//		self.view.insertSubview(view1, at: 1)
//		self.view.insertSubview(view1, aboveSubview: view)
//		self.view.insertSubview(view1, belowSubview: view)
//		self.view.removeFromSuperview()
		
		//1.4UIView交互属性
		view.isUserInteractionEnabled = true
		let guesture = UITapGestureRecognizer(target: self, action: #selector(addTap))
		view.addGestureRecognizer(guesture)
//		let drop = UIInteraction.Pro
//		view1 .addInteraction(drop)
		
		//1.5UIView变型操作
		let trans = CGAffineTransform.init()
		trans.translatedBy(x: 0, y: 50)
		view1.transform = trans
		trans.rotated(by: 10)///旋转
		trans.scaledBy(x: 100, y: 100)//缩放
		trans.inverted()//反转
		trans.concatenating(trans) //放射效果叠加
		//1.6自定义UIView
		
		
		//CALayer层
		//2.1CALayer边框
		let layer = CALayer()
		layer.borderWidth = 0.5
		layer.borderColor = UIColor.red.cgColor
		//2.2CALayer阴影
		layer.shadowOpacity = 0.5
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize.init(width: 10, height: 10)
		layer.shadowRadius = 5
		//2.3CALayer圆角
		layer.cornerRadius = 10
		layer.masksToBounds = true //沿着圆角边缘对视图中的内容进行裁切
		//2.4CALayer渐变
//		layer.
    }
	@objc func addTap(){
		
	}

    /*
 
    */

}
