//
//  WW_AfterInfoPickImageCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/5.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import TZImagePickerController

class WW_AfterInfoPickImageCell: UITableViewCell {

    typealias Select_Photo_Block = (_ selectArray:NSArray) -> Void
    var select_photo_block : Select_Photo_Block?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isUserInteractionEnabled = true
        self.selectionStyle = .none
        self.backgroundColor = .white
        creatUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI(){
        contentView.addSubview(self.selectPhotoView)
        self.selectPhotoView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
        }
        self.selectPhotoView.nav = self.nav
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    lazy var nav : UINavigationController = {
        let n = UINavigationController.init()
        return n
    }()
    
    lazy var selectPhotoView : WW_SelectPhotoView = {
//        let v = WW_SelectPhotoView.init(selectType: .selecct_single_photo, imageUrl: "")
        let v = WW_SelectPhotoView.init(selectType: .select_multiple_photos, photosCount: 3)
        return v
    }()
}

