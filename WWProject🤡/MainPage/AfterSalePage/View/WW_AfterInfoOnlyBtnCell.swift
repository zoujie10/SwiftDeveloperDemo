//
//  WW_AfterInfoOnlyBtnCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/5.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_AfterInfoOnlyBtnCell: UITableViewCell {
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

}
