//
//  PageViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/29.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {
	var pageIndex = 0
	
	//所有页面的视图控制器
	private(set) lazy var allViewControllers: [UIViewController] = {
		return [self.getViewController(indentifier: "firstPage"),
				self.getViewController(indentifier: "secondPage"),
				self.getViewController(indentifier: "thirdPage")]
	}()
	
	private func getViewController(indentifier: String) -> UIViewController {
		return UIStoryboard(name: "Main", bundle: nil) .
			instantiateViewController(withIdentifier: "\(indentifier)")
	}
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		dataSource = self
		delegate = self
		
		self.isDoubleSided = true
		//设置首页
		if let firstViewController = allViewControllers.first {
			setViewControllers([firstViewController],
							   direction: .forward,
							   animated: true,
							   completion: nil)
		}
    }

	
	//MARK:DATASOURCE
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		
		guard let viewControllerIndex = allViewControllers.index(of: viewController) else {
			return nil
		}
		
		let previousIndex = viewControllerIndex - 1
		
		//如果当前是首页，向右滑显示最后一个页面
		guard previousIndex >= 0 else {
			return allViewControllers.last
		}
		
		guard allViewControllers.count > previousIndex else {
			return nil
		}
		
		return allViewControllers[previousIndex]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let viewControllerIndex = allViewControllers.index(of: viewController) else {
			return nil
		}
		
		let nextIndex = viewControllerIndex + 1
		
		let orderedViewControllersCount = allViewControllers.count
		
		//如果当前是最后一个页面，向左滑显示首页
		guard orderedViewControllersCount != nextIndex else {
			return allViewControllers.first
		}
		
		guard orderedViewControllersCount > nextIndex else {
			return nil
		}
		return allViewControllers[nextIndex]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		if completed == false{
			
		}else{
			pageIndex+=1
		}
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
