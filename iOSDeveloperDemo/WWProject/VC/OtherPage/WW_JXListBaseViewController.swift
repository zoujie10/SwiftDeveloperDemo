//
//  WW_JXListBaseViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/23.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import JXSegmentedView

class WW_JXListBaseViewController: WW_MainBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
    }
    

}
extension WW_JXListBaseViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
