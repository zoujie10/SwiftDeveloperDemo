//
//  MineViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/4.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class MineViewController: UIViewController,PhilosopherDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
		let Person = Philosopher()
		Person.delegate = self
		Person.start()
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
    }
	
	func sleep() {
		print("sleep...")
	}
	
	func eat() {
		print("eat....")
	}
	
	func work() {
		print("work...")
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
