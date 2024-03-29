//
//  WW_CartSuperpositionSelectActivityHeaderCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/27.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartSuperpositionSelectActivityHeaderCell: UITableViewCell {
    
    var activitySubView = WW_CartActivityProdcutSelectSubview()
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(r: 246, g: 246, b: 246)
        contentView.addSubview(activitySubView)
        activitySubView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12))
        }
    }
    
    func configeCellData(data:WW_CartActivityModel){
        let str = data.way == 2 ? "指定赠品" : " "
        self.activitySubView.tempLabel.text = data.actName! + str
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class WW_CartActivityProdcutSelectSubview:UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.borderWidth = 0.1
        self.layer.borderColor = UIColor.lightGray.cgColor
        addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tempLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        
        label.textColor = UIColor(r: 37, g: 37, b: 40)
        label.text = "满赠自选"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label;
    }()
}
