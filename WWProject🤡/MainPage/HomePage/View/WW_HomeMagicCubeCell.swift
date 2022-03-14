//
//  WW_HomeMagicCubeCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/22.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
/*
//TODO 3种样式：
 口|口   二宫格
-----
 品      三宫格
------
口|口
————    四宫格
口|口
 */
class WW_HomeMagecCubeSubCell:UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setSubView(){
        self.contentView.addSubview(self.magicImageView)
        self.magicImageView.snp.makeConstraints { make in
            make.edges.equalTo(self.contentView)
        }
        self.magicImageView.kf.setImage(with: URL.init(string: "https://hotkidceo-1251330842.file.myqcloud.com/2021121709491500052.png"))
        self.magicImageView.kf.indicatorType = .activity
    }
    lazy var magicImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cornel_branch_tree")
        return imageView
    }()
}
class WW_HomeMagicCubeCell: WW_HomeBaseCell {
    override func initContentView() {
        super.initContentView()
    
        self.contentView.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.left.right.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(5)
            make.bottom.equalTo(self.contentView).offset(-5)
        }
    }
    
    lazy var collectionView : UICollectionView = {
        let c = UICollectionView.init(frame: .zero, collectionViewLayout: self.layout)
        c.backgroundColor = .clear
        c.delegate = self
        c.dataSource = self
        c.showsHorizontalScrollIndicator = false
        c.register(WW_HomeMagecCubeSubCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(WW_HomeMagecCubeSubCell.classForCoder()))
        return c
    }()
    lazy var layout :UICollectionViewFlowLayout = {
        let l = UICollectionViewFlowLayout()
//        l.minimumLineSpacing = 0
//        l.minimumInteritemSpacing = 0
        l.sectionInset = .zero
        l.scrollDirection = .horizontal
        return l
    }()
    
}
extension WW_HomeMagicCubeCell : UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell : WW_HomeMagecCubeSubCell =  collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(WW_HomeMagecCubeSubCell.classForCoder()), for: indexPath) as! WW_HomeMagecCubeSubCell
        if(indexPath.row == 1){
            cell.magicImageView.kf.setImage(with: URL.init(string: "https://hotkidceo-1251330842.file.myqcloud.com/2021100810355100336.png"))
            cell.magicImageView.kf.indicatorType = .activity
        }else{
            cell.magicImageView.kf.setImage(with: URL.init(string: "https://hotkidceo-1251330842.file.myqcloud.com/2021100810353200335.png"))
            cell.magicImageView.kf.indicatorType = .activity
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // count = 3 第一个item CGSize(width: (WWScreenWidth-30), height: 160)
        return CGSize(width: (WWScreenWidth-30)/2, height: 160)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // count = 3
        
        return UIEdgeInsets.init(top: 8, left: 10, bottom: 8, right: 10)
    }
}
