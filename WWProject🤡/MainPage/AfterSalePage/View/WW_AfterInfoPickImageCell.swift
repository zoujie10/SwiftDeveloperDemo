//
//  WW_AfterInfoPickImageCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/5.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import TZImagePickerController

class WW_AfterInfoPickImageCell: UITableViewCell,TZImagePickerControllerDelegate, UINavigationControllerDelegate {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isUserInteractionEnabled = true
        self.selectionStyle = .none
        creatUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){}
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    lazy var nav : UINavigationController = {
        let n = UINavigationController.init()
        return n
    }()
    
    
    lazy var imagePickVC : TZImagePickerController = {
        let vc = TZImagePickerController.init()
        vc.delegate = self
        // set appearance / 改变相册选择页的导航栏外观
        vc.navigationBar.barTintColor = self.nav.navigationBar.barTintColor
        vc.navigationBar.tintColor = self.nav.navigationBar.tintColor
        let tzBarItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [TZImagePickerController.self])
        let barItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIImagePickerController.self])
        let titleTextAttributes : NSDictionary = tzBarItem.titleTextAttributes(for: .normal)! as NSDictionary
        barItem.setTitleTextAttributes(titleTextAttributes as? [NSAttributedStringKey : Any], for: .normal)
        return vc
    }()
}
