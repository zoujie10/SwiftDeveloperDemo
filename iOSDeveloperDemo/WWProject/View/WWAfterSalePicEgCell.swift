//
//  WWAfterSalePicEgCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/20.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WWAfterSalePicEgCell: UITableViewCell {

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
        self.contentView.addSubview(picImageView)
        self.picImageView.snp.makeConstraints{
            $0.width.equalTo(260)
            $0.height.equalTo(160)
            $0.center.equalTo(self.contentView)
        }
    }
    var picImageView : UIImageView = {
        let picImageView  = UIImageView()
        return picImageView
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
