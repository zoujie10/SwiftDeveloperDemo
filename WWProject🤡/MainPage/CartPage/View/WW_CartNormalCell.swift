//
//  WW_CartNormalCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/4/7.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CartNormalCell: UITableViewCell,WWCartEditNumViewDelegate {
   
    typealias AddItemBlock = () -> Void
    typealias RemoveItemBlock = () -> Void
    typealias SelectItemBlock = (Bool) -> Void
    typealias EditBlock = (Int) -> Void
    var addItemBlock: AddItemBlock?
    var removeItemBlock: RemoveItemBlock?
    var selectItemBlock: SelectItemBlock?
    var editBlock: EditBlock?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.backgroundColor = UIColor(r: 247, g: 247, b: 247)
            creatUI()
    }
    
    func creatUI(){
        self.contentView.addSubview(self.backgroudView)
        self.backgroudView.addSubview(self.iconImageView)
        self.backgroudView.addSubview(self.selectButton)
        self.backgroudView.addSubview(self.titleLabel)
        self.backgroudView.addSubview(self.desLabel)
        self.backgroudView.addSubview(self.priceLable)
        self.backgroudView.addSubview(self.editNumView)

        self.backgroudView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 8, left: 12, bottom: 0, right: 12))
        }
        
        self.iconImageView.snp.makeConstraints {
            $0.top.left.equalTo(self.contentView).offset(45)
            $0.width.height.equalTo(80)
        }
        
        self.selectButton.snp.makeConstraints { make in
            make.left.equalTo(self.backgroudView)
            make.right.equalTo(self.iconImageView.snp_left)
            make.height.equalTo(84)
            make.centerY.equalTo(self.iconImageView)
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.iconImageView.snp_top)
            $0.left.equalTo(self.iconImageView.snp_right).offset(10)
        }
        self.desLabel.snp.makeConstraints {
            $0.left.equalTo(self.titleLabel.snp_left)
            $0.top.equalTo(self.titleLabel.snp_bottom).offset(10)
        }
        self.priceLable.snp.makeConstraints {
            $0.left.equalTo(self.titleLabel.snp_left)
            $0.top.equalTo(self.iconImageView.snp_bottom).offset(-10)
        }
    }
    
    func configData(model : WW_CartItem){
        self.iconImageView.kf.setImage(with: URL.init(string: (model.wpProductTemplate?.list_images!)!))
        self.iconImageView.kf.indicatorType = .activity
        self.titleLabel.text = model.wpProductTemplate?.name
        
    }
    
    
    @objc func clickBtnMethod(){
        
    }
    //MARK: editnumView delegate
    func cartEditNumView(_ editNumView: WW_CartEditNumView?, addButtonClick sender: UIButton?) {
        
    }
    
    func cartEditNumView(_ editNumView: WW_CartEditNumView?, minusButtonClick sender: UIButton?) {
        
    }
    
    func cartEditNumView(_ editNumView: WW_CartEditNumView?, textFieldTextChange sender: UITextField?) {
        
    }
    
    func cartEditNumView(_ editNumView: WW_CartEditNumView?, textFieldDidEndEdit sender: UITextField?) {
        
    }
    
    lazy var backgroudView : UIView = {
        let backgroudView = UIView()
        backgroudView.backgroundColor = .white
        backgroudView.layer.shadowColor = UIColor(r: 0, g: 0, b: 0, a: 0.2).cgColor
        backgroudView.layer.shadowOffset = CGSize(width: 0, height: 3)
        backgroudView.layer.shadowOpacity = 1
        backgroudView.layer.shadowRadius = 5
        backgroudView.layer.cornerRadius = 7
        return backgroudView
    }()
    
    lazy var editNumView : WW_CartEditNumView = {
        let view = WW_CartEditNumView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var selectButton : UIButton = {
        let btn = UIButton()
//        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(named: "ww_shoping_carts_unselect_btn_img_dark"), for: .normal)
        btn.setImage(UIImage(named: "ww_shoping_carts_select_btn_img_dark"), for: .selected)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(clickBtnMethod), for: .touchUpInside)
        return btn
    }()
    
    lazy var iconImageView : UIImageView = {
        let iconImageView = UIImageView()
        return iconImageView
    }()
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "商品名"
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    lazy var desLabel : UILabel = {
       let desLabel = UILabel()
        desLabel.text = "商品描述"
        desLabel.textColor = UIColor.lightGray
        desLabel.textAlignment = .left
        return desLabel
    }()
    
    lazy var priceLable : UILabel = {
        let priceLable = UILabel()
        priceLable.text = "￥4.01"
        priceLable.textColor = UIColor.red
        priceLable.textAlignment = .left
        return priceLable
    }()
    
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
