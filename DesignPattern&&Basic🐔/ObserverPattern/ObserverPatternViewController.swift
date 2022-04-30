//
//  ObserverPatternViewController.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 5/16/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class ObserverPatternViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let observerd = Observerd()
        observerd.Valuechange()
        observerd.Valuechange(value: "noti")
    }


}
