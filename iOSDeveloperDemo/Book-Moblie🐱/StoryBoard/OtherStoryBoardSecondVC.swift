//
//  OtherStoryBoardSecondVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/28.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class OtherStoryBoardSecondVC: UIViewController {

    @IBOutlet var VC_Name: UILabel!
    var message = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let str = VC_Name.text
        VC_Name.text = str! + message
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
