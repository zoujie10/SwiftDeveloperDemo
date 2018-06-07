//
//  BlueViewController.swift
//  iOSDeveloperiPadDemo
//
//  Created by Zoujie on 2018/6/6.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

	@IBAction func TapAction(_ sender: UIButton) {
		print("Tap blueView")
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
