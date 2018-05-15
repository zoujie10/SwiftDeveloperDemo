//
//  PickDataViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/14.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class PickDataViewController: UIViewController {
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
		
        // Do any additional setup after loading the view.
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
