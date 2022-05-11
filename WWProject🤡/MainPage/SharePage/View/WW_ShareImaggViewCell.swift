//
//  WW_ShareImaggViewCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/11.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_ShareImaggViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configContentView()
    }
    /* required init?(coder: NSCoder)
    为什么一定要添加
    这是NSCoding protocol定义的，遵守了NSCoding protoaol的所有类必须继承。只是有的情况会隐式继承，而有的情况下需要显示实现。

     什么情况下要显示添加：
    当我们在子类定义了指定初始化器(包括自定义和重写父类指定初始化器)，那么必须显示实现required init?(coder aDecoder: NSCoder)，而其他情况下则会隐式继承，不用理会。
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configContentView(){
        contentView.addSubview(itemImageView)
        itemImageView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        }
    }
    
    
    lazy var itemImageView : UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "cornel_branch_tree")
        return imageView
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
