//
//  WW_CustomerChooseListCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/24.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CustomerChooseListCell: UITableViewCell {

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    func creatUI(){
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }

    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = UIColor(r: 252, g: 85, b: 108, a: 1)
        label.textColor = UIColor(r: 128, g: 132, b: 139, a: 1)
        label.font = .boldSystemFont(ofSize: 12)
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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
