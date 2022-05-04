//
//  WW_AfterInfoTitleTextCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/4.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_AfterInfoTitleTextCell: UITableViewCell {

    
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
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0))
        }
    }
    
    
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .white
        label.textColor = UIColor(r: 52, g: 52, b: 52)
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label;
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
