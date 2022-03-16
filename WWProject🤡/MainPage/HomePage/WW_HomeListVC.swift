//
//  WW_HomeListVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/1.
//  Copyright © 2022 Zoujie. All rights reserved.

//HAPPY NEW YEAR 2022.02.01

//1. UI searchTitleView +navBgImageView + collectionView
//2. Cell 注册 根据请求 取要用的cell
//3. 首页包含的Cell 注册  按请求显示需要展示的cell
//4. 数据结构返回的数组 每个type 是一个 section

import UIKit

class WW_HomeListVC: WW_MainBaseVC {
        
    let homePageViewModel  = WW_HomePageListViewModel()
    
    var showCellClassArray = [WW_HomeBaseCell.classForCoder()]
    //对应 WW_HomeItemType 枚举位置
    let totalCellClassArray = [WW_HomeBaseCell.classForCoder(),//占位 0
                               WW_HomeBaseCell.classForCoder(),//1
                               WW_HomeBannerCell.classForCoder(),
                               WW_HomeBaseCell.classForCoder(),//3
                               WW_HomeBaseCell.classForCoder(),//4
                               WW_HomeBaseCell.classForCoder(),//5
                               WW_HomePubicNoticeCell.classForCoder(),//6
                               WW_HomeCouponCell.classForCoder(),//7 优惠券（2宫格）
                               WW_HomeCouponCell.classForCoder(),//8 优惠券（3宫格）
                               WW_HomeCouponCell.classForCoder(),//9 优惠券（4宫格）
                               WW_HomePubicNoticeCell.classForCoder(),//10 公告
                               WW_HomeMagicCubeCell.classForCoder(),//11 魔方（2宫格）
                               WW_HomeMagicCubeCell.classForCoder(),//12 魔方（3宫格）
                               WW_HomeMagicCubeCell.classForCoder(),//13 魔方（4宫格）
                               WW_HomeRecommendsCell.classForCoder(),//14 商品列表
                               WW_HomePubicNoticeCell.classForCoder(),//15 为你推荐（标题）
                               WW_HomePubicNoticeCell.classForCoder(),//16 为你推荐（结束语）
                               WW_HomeChannelCell.classForCoder(),//17 频道导航
                               WW_HomeFreeGiftCell.classForCoder(),//18 限时满赠
                               WW_HomeSecondKillCell.classForCoder(),//19 限时秒杀
                               WW_HomePubicNoticeCell.classForCoder(),//20 新人专区
                               WW_HomeFrequentlyBuyListCell.classForCoder(),//21 常购清单
                               WW_HomeBaseCell.classForCoder(),//22 占位
                               WW_HomeChannelSingleItemCell.classForCoder()//23 频道导航Z型 单体item
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homePageViewModel.getHomePageList()
        self.homePageViewModel.dataResultComplete = {
          let array = self.homePageViewModel.itemTypeArray()
            self.showCellClassArray.removeAll()
            for index in array{
                self.showCellClassArray.append(self.totalCellClassArray[Int(index)!])
            }
            self.collectionView.reloadData()
        }
        configUI()
        registerAllCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    func configUI(){
        let navBgView = UIView()
//        navBgView.backgroundColor = UIColor(r: 252, g: 85, b: 108)
        navBgView.backgroundColor = .clear
        navBgView.addSubview(self.searchTitlebgImageView)
        navBgView.addSubview(self.navSearchTitleView)
        self.view.addSubview(self.searchBgImageView)
        self.view.addSubview(navBgView)
        self.view.addSubview(self.collectionView)
        
        self.searchBgImageView.snp.makeConstraints { make in
            make.top.equalTo(self.view)
            make.left.right.equalTo(self.view)
            make.height.equalTo(150)
        }
        self.searchBgImageView.kf.setImage(with: URL.init(string: "https://hotkidceo-1251330842.cos.ap-shanghai.myqcloud.com/2021081916225600139.jpeg"))
        self.searchBgImageView.kf.indicatorType = .activity
        
        navBgView.snp.makeConstraints { make in
            make.top.equalTo(self.view)
            make.left.right.equalTo(self.view)
            make.height.equalTo(100)
        }
        self.searchTitlebgImageView.snp.makeConstraints { make in
            make.edges.equalTo(navBgView)
        }
        
        self.navSearchTitleView.snp.makeConstraints { make in
            make.width.equalTo(270)
            make.height.equalTo(35)
            make.top.equalTo(navBgView).offset(55)
            make.centerX.equalTo(navBgView)
        }
        let image = self.searchBgImageView.image
        if(image != nil){
            let rect = CGRect(x: 0, y: 0, width: image!.size.width, height: 88*image!.size.width/WWScreenWidth)
            let imageRef = image!.cgImage!.cropping(to: rect)
            self.searchTitlebgImageView.image = UIImage(cgImage: imageRef!)
          
        }else{
            
        }
        self.collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(navBgView.snp_bottom)
        }
    }
    func registerAllCell(){
        for classCode : AnyClass in self.totalCellClassArray{
            self.collectionView.register(classCode, forCellWithReuseIdentifier:NSStringFromClass(classCode))
        }
    }
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //滚动方向有关系:滚动方向相同的间距为minimumLineSpacing 垂直的minimumInteritemSpacing
        layout.minimumLineSpacing = 8;
        layout.minimumInteritemSpacing = 8;
        layout.scrollDirection = .vertical
        let v = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        v.backgroundColor = .clear
        v.showsVerticalScrollIndicator = true
        v.showsHorizontalScrollIndicator = false
        v.delegate = self
        v.dataSource = self
        return v
    }()
    
    lazy var navSearchTitleView : WW_SearchTitleView = {
        let v = WW_SearchTitleView()
        v.searchWords = "旺仔牛奶"
        v.clickSearchBlock = { words in
            if words == "Jump"{
                self.navigationController?.popViewController(animated: true)
            }
        }
        v.onOnlyJump = true
        return v
    }()
    
    lazy var searchBgImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var searchTitlebgImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
}


extension WW_HomeListVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let classCell: AnyClass = self.showCellClassArray[indexPath.section]
        let cell : WW_HomeBaseCell = collectionView.dequeueReusableCell(withReuseIdentifier:NSStringFromClass(classCell), for: indexPath) as! WW_HomeBaseCell
        
        if cell.isKind(of: WW_HomeRecommendsCell.self){
           print("guess your like cell")
        }else{
            let model = self.homePageViewModel.creatItemViewModel(index: indexPath.section)
            if (model != nil){
                cell.updateData(itemData:model!)
            }
    
            if (cell.isKind(of: WW_HomeBannerCell.self)){
                print("banner cell")

            }else if (cell.isKind(of: WW_HomeFreeGiftCell.self)){
                print("free gift")
            }else if (cell.isKind(of: WW_HomeSecondKillCell.self)){
                print("second kill")
            }
        }

        cell.cellAction_block = { type,subType in
            self.allClickAction(type: type, subType: subType)
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.showCellClassArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cell: AnyClass = self.showCellClassArray[section]
        if cell == WW_HomeRecommendsCell.classForCoder(){
            let model = self.homePageViewModel.creatItemViewModel(index: section)
            return model?.configureAttributeList?.count ?? 0
        }else{
            return 1
        }
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemSize = CGSize(width: WWScreenWidth, height: 0.1)
        if self.homePageViewModel.itemTypeArray().count > 0{
            itemSize = self.homePageViewModel.cellSize(asseType: Int(self.homePageViewModel.itemTypeArray()[indexPath.section])!)
        }
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cell: AnyClass = self.showCellClassArray[section]
        if cell == WW_HomeRecommendsCell.classForCoder(){
            return UIEdgeInsets.init(top: 8, left: 15, bottom: 8, right: 15)
        }else{
            return UIEdgeInsets.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section,indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0{
            self.searchBgImageView.snp.updateConstraints { make in
                make.top.equalTo(self.view).offset(-scrollView.contentOffset.y)
            }
        }else{
            self.searchBgImageView.snp.updateConstraints { make in
                make.top.equalTo(self.view)
            }
        }
    }
    //MARK: 跳转逻辑
    func allClickAction(type:WWBHomeItemLinkType,subType:WWBHomeItemLinkSubType){
        switch type {
            case .WWBHomeItemLinkTypeNone:
                    print(type)
            case .WWBHomeItemLinkTypeH5:
                self.navigationController?.pushViewController(SwiftWebViewAndHTML5VC.init(url: "www.baidu.com", webTitle: "跳转"), animated: true)
                print(type)
            case .WWBHomeItemLinkTypeGoods:
                print(type)
            case .WWBHomeItemLinkTypeModule:
                print(type)
                self.allClickSubTypeAction(subType: subType)
            case .WWBHomeItemLinkTypeCoupon:
                print(type)
            case .WWBHomeItemLinkTypeActivity:
                print(type)
            case .WWBHomeItemLinkTypeFile:
                print(type)
            case .WWBHomeItemLinkTypeFunction:
                print(type)
            case .WWBHomeItemLinkTypeShare:
                print(type)
            case .WWBHomeItemLinkTypeAddCart:
                print(type)
            case .WWBHomeItemLinkTypeLogin:
                print(type)
        }
    }
    func allClickSubTypeAction(subType:WWBHomeItemLinkSubType){
        switch subType {
            case .WWBHomeItemLinkSubTypeCouponCenter:
                print("subtype",subType)
            case .WWBHomeItemLinkSubTypeLabelSecond:
                print("subtype",subType)
            case .WWBHomeItemLinkSubTypeCategorySecond:
                print("subtype",subType)
            case .WWBHomeItemLinkSubTypeMessageCenter:
                print("subtype",subType)
            case .WWBHomeItemLinkSubTypeSearchSecond:
                print("subtype",subType)
            case .WWBHomeItemLinkSubTypeMyPage:
                print("subtype",subType)
            case .WWBHomeItemLinkSubTypeBannerSecond:
                print("subtype",subType)
            default:
                print("subtype",subType)
        }
    }
}
