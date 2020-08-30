//
//  TextViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/7.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

	@IBAction func JumpPickView(_ sender: UIButton) {
		
	}
	@IBAction func leftSwitchTouch(_ sender: UISwitch) {
		print("Left:",sender.isOn)
	}

	
	@IBAction func RightSwitchTouch(_ sender: Any) {
		let switchBtn = sender as! UISwitch
		let setting = switchBtn.isOn
		print("Right:",setting)
	}
	
	@IBAction func segBtn(_ sender: UISegmentedControl) {
		print("segNo:",sender.selectedSegmentIndex)
//		if sender.selectedSegmentIndex == 1{
			sliderValue.value = sliderValue.value + 0.1
//		}
	}
	@IBOutlet var sliderValue: UISlider!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.brown
		sliderValue.value = 0
		sliderValue.maximumValue = 3
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.dismiss(animated: true) {
			
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
