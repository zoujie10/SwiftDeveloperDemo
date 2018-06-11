//
//  CustomTableViewCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/18.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

	@IBOutlet var myLable: UILabel!
	@IBOutlet var myImageView: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
