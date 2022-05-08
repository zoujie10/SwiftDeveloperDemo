//
//  WW_LabelAndButtonCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/4.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
enum Click_Btn_Jump_Type {
    case Click_Btn_Jump_Address
    case Click_Btn_Jump_Select
    case Click_Btn_Jump_Alert
}
class WW_LabelAndButtonCell: UITableViewCell {

    typealias click_Type_Block = (Click_Btn_Jump_Type) -> Void
    var click_Block : click_Type_Block?

    var jump_type : Click_Btn_Jump_Type = .Click_Btn_Jump_Select
    
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
        
        contentView.addSubview(arrowBtn)
        arrowBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(contentView).offset(-15)
            make.size.equalTo(CGSize(width: 5, height: 10));
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
    
    lazy var arrowBtn : UIButton = {
        let btn = UIButton()
//        btn.setTitle("", for: .normal)
//        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(named: "ww_aftersale_apply_select_right_arrow"), for: .normal)
        btn.addTarget(self, action: #selector(clickBtnMethod), for: .touchUpInside)
        return btn
    }()
    
    @objc func clickBtnMethod(){
        self.click_Block!(self.jump_type)
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
