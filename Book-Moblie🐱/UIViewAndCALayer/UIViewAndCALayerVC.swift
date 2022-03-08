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
		self.view.backgroundColor = UIColor.white
		makeUI()
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
		view.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
		self.view.addSubview(view)
		
		//1.2UIView几何属性
		//了解坐标系  UIKit X轴正方向向右 → Y轴正方向向下 “↓”  Quartz 2D绘图 X轴正方向向右 → Y轴正方向向上 “↑”
		view1.frame = CGRect.init(x: 10, y: 10, width: 100, height: 100)
        self.view.addSubview(view1)
		//1.3UIView嵌套层次关系  层次管理方法
//		view.addSubview(view1)
		self.view.insertSubview(view1, at: 1)
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
//		let trans = CGAffineTransform.init()
//		view1.transform = trans

//		trans.translatedBy(x: 0, y: 50)
//		trans.rotated(by: 30)

//		trans.scaledBy(x: 50, y: 50)//缩放
		
//		trans.rotated(by: 10)//旋转
//		trans.inverted()//反转
//		trans.concatenating(trans) //放射效果叠加
		
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
		view.layer.borderColor = UIColor.red.cgColor
		
		//2.4CALayer渐变
		let layerColor =	CAGradientLayer()
//		layerColor.colors = [UIColor.red.cgColor,UIColor.orange.cgColor,UIColor.blue.cgColor]
        layerColor.colors = [UIColor(r: 209, g: 153, b: 135).cgColor,UIColor(r: 187, g: 108, b: 95).cgColor]
		layerColor.frame = view1.frame
		layerColor.startPoint = CGPoint(x: 0, y: 0)
		layerColor.endPoint = CGPoint(x: 1, y: 1)
//		layerColor.locations = [0,0.3,1]//设置渐变层的各颜色点在颜色线中的分布情况。在locations属性值数组中的0.3表示渐变线中间的颜色，即橙色将位于渐变线30%的位置
        layerColor.locations = [0.5,1]
		view1.layer.addSublayer(layerColor)
    }
    
    let trans = CGAffineTransform.init(rotationAngle: 40)
    
	@objc func addTap(){
		print("Tap---Tap")
        //UIView变型操作
        self.view1.transform = trans
	}

    func makeUI(){
        view.addSubview(viewsLabel)
        viewsLabel.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(300)
        }
    }
    
    lazy var view1: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.red
        return v
    }()
    
    lazy var viewsLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "      NSObject ->  UIResponder -> UIView -> UIWindow,UILabel,UIButton,UIPickerView,UIProgressView,UIScrollView,UITableView,UICollectionView,UIActivityIndicatorView,UIImageView,UISearchBar,UINavigationBar,UIPageControl,UISwitch,UISlider,UIDatePicker,UISegmentedControl,UITextView,UITextField"
        return label;
    }()

}
