//
//  DetailViewController.swift
//  iOSDeveloperiPadDemo
//
//  Created by Zoujie on 2018/6/6.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	var yellowViewController : YellowViewController!
	var blueViewController : BlueViewController!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.yellowViewController = UIStoryboard(name: "Main", bundle: nil) .
			instantiateViewController(withIdentifier: "yellowViewController") as! YellowViewController
		self.blueViewController = UIStoryboard(name: "Main", bundle: nil) .
			instantiateViewController(withIdentifier: "blueViewController") as! BlueViewController
		
		self.view.addSubview(self.yellowViewController.view)
		self.view.addSubview(self.blueViewController.view)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func updateView(row : Int)  {
		if row == 0{
			if self.yellowViewController.view.superview != nil{
				self.yellowViewController.view.removeFromSuperview()
			}
			if self.blueViewController.view.superview == nil{
				self.view.addSubview(self.blueViewController.view)
			}
		}else{
			if self.blueViewController.view.superview != nil{
				self.blueViewController.view.removeFromSuperview()
			}
			if self.yellowViewController.view.superview == nil{
				self.view.addSubview(self.yellowViewController.view)
			}
		}
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
