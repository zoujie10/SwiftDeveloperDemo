//
//  PageControlViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/28.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController , UIScrollViewDelegate {
	var page1 : UIView!
	var page2 : UIView!
	var page3 : UIView!
	
	@IBOutlet var mainScrollView: UIScrollView!
	
	@IBOutlet var pageControlView: UIPageControl!
	
	@IBAction func pageChangeValue(_ sender: UIPageControl) {
		let witchPage = self.pageControlView.currentPage
		self.mainScrollView.contentOffset = CGPoint(x: self.view.frame.size.width * CGFloat(witchPage), y: 0)
		
	}
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.mainScrollView.delegate = self
		
		self.mainScrollView.contentSize = CGSize(width: self.view.frame.size.width*3, height: self.mainScrollView.frame.size.height)

//		let page1ViewController = mainStroyBoard.instantiateViewController(withIdentifier: "page1") as UIViewController
		self.page1 = UIView()
		self.page1.frame = CGRect(x: 0, y: 32, width: self.view.frame.size.width, height: 551)
//		self.page1.backgroundColor = UIColor.orange
		let imageView : UIImageView = UIImageView()
		imageView.image = UIImage(named: "fruiticons_buttons_strawberry")
		imageView.frame = self.page1.frame //ImageView父视图为各自page 所以坐标大小都为page1
		self.page1.addSubview(imageView)
		self.mainScrollView.addSubview(self.page1)
		
//		let page2ViewController = mainStroyBoard.instantiateViewController(withIdentifier: "page2") as UIViewController
//		self.page2 = page2ViewController.view
		self.page2 = UIView()
		self.page2.frame = CGRect(x: self.view.frame.size.width, y: 32, width: self.view.frame.size.width, height: 551)
//		self.page2.backgroundColor = UIColor.lightGray
		let imageView2 : UIImageView = UIImageView()
		imageView2.image = UIImage(named: "fruiticons_buttons_pineapple")
		imageView2.frame = self.page1.frame //ImageView父视图为各自page
		self.page2.addSubview(imageView2)
		self.mainScrollView.addSubview(self.page2)
		
//		let page3ViewController = mainStroyBoard.instantiateViewController(withIdentifier: "page3") as UIViewController
//		self.page3 = page3ViewController.view
		self.page3 = UIView()
		self.page3.frame = CGRect(x: self.view.frame.size.width*2, y: 32, width: self.view.frame.size.width, height: 551)
//		self.page3.backgroundColor = UIColor.blue
		let imageView3 : UIImageView = UIImageView()
		imageView3.image = UIImage(named: "fruiticons_buttons_pear")
		imageView3.frame = self.page1.frame  //ImageView父视图为各自page
		self.page3.addSubview(imageView3)
		self.mainScrollView.addSubview(self.page3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	//MARK: SCROLL DELEGATE
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offSet = scrollView.contentOffset
		self.pageControlView.currentPage = Int(offSet.x)/375
	}
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
