//
//  WW_AfterInfoTextCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/4.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_AfterInfoTextCell: UITableViewCell {

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isUserInteractionEnabled = true
        self.selectionStyle = .none
        creatUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsetsMake(0, 20, 0, 0))
        }
    }
    
    
    lazy var contentLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .white
        
        label.textColor = UIColor(r: 52, g: 52, b: 52)
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 13)
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
