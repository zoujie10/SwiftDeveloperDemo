//
//  WW_AfterInfoPickImageCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/5/5.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
import TZImagePickerController

class WW_AfterInfoPickImageCell: UITableViewCell,TZImagePickerControllerDelegate,UINavigationControllerDelegate {
//    @property (nonatomic , strong) UIImagePickerController *imagePickerVc;
//    @property (nonatomic , strong) UICollectionView *takePhotoCollectionView;
//    @property (nonatomic , strong) LxGridViewFlowLayout *layout;
//    @property (nonatomic , strong) NSMutableArray *selectedPhotos;
//    @property (nonatomic , strong) NSMutableArray *selectedAssets;
//    @property (nonatomic , assign) BOOL isSelectOriginalPhoto;
//    @property (nonatomic , strong) CLLocation *location;
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
        contentView.addSubview(takePhotoCollectionView)
        takePhotoCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15))
        }
        
        
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
    
    
    lazy var imagePickVC : TZImagePickerController = {
        let vc = TZImagePickerController.init()
        vc.delegate = self
        // set appearance / 改变相册选择页的导航栏外观
        vc.navigationBar.barTintColor = self.nav.navigationBar.barTintColor
        vc.navigationBar.tintColor = self.nav.navigationBar.tintColor
        let tzBarItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [TZImagePickerController.self])
        let barItem = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UIImagePickerController.self])
        let titleTextAttributes : NSDictionary = tzBarItem.titleTextAttributes(for: .normal)! as NSDictionary
        barItem.setTitleTextAttributes(titleTextAttributes as? [NSAttributedStringKey : Any], for: .normal)
        return vc
    }()
    
    lazy var takePhotoCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: 97, height: 97)
        let view = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        view.register(WW_AfterPickImageCell.classForCoder(), forCellWithReuseIdentifier: "Cell")
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        view.layer.cornerRadius = 4
        return view
    }()
}
extension WW_AfterInfoPickImageCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WW_AfterPickImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WW_AfterPickImageCell
        return cell
    }
    
    
}
