//
//  WW_OnlyTextFieldCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/4.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_OnlyTextFieldCell: UITableViewCell {

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isUserInteractionEnabled = false
        self.selectionStyle = .none
        creatUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        contentView.addSubview(mainTextField)
        mainTextField.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsetsMake(0, 20, 0, 30))
        }
    }
    
    lazy var mainTextField : UITextField = {
        let tx = UITextField()
        return tx
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
