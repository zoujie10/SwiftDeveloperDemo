//
//  WWSearchResultVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/22.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchResultVC: WW_MainBaseVC {
    var searchTitleView = WW_SearchTitleView()
    var searchResultViewmodel = WW_SearchResultViewModel()
    
    var keyWord : String = ""
    let historyManage = WW_SearchHistoryWordsManager()
    var header = WW_RefreshStateHeader()
    var footer = WW_RefreshAutoGifFooter()
    var indexPage : Int = 1
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 247, g: 247, b: 247)
        self.requestSearchResult(keyWord: keyWord, currentPage: 1, pageSize: 12)
        configUI()
    }
    func requestSearchResult(keyWord:String,currentPage:Int,pageSize:Int){
        self.searchResultViewmodel.getSearchWords(serchWord: keyWord, currentPage: currentPage, pageSize: 12)
        self.searchResultViewmodel.dataResultComplete = {
            if(self.searchResultViewmodel.productsArray.count < 1){
                self.emptyView.isHidden = false;
                self.requestGuessYourLike(page: 1)
            }else{
                self.emptyView.isHidden = true
                if self.searchResultViewmodel.searchNoMore == true{
                    self.requestGuessYourLike(page: 1)
                }else{
                    self.mainCollectionView.reloadData()
                }
            }
        }
    }
    
    func requestGuessYourLike(page:Int){
        self.searchResultViewmodel.getGuessYourlike(page: page)
        self.searchResultViewmodel.guessYourLikedataResultComplete = {
            if self.searchResultViewmodel.guessYourLikeNoMore == true{
                self.mainCollectionView.mj_footer?.endRefreshingWithNoMoreData()
            }
            self.mainCollectionView.reloadData()
            
        }
    }
    
    func configUI(){
        self.navigationItem.titleView = self.searchTitleView
        self.searchTitleView.frame = CGRect(x: 0, y: 0, width: 270, height: 35)
//        self.searchTitleView.searchWords = "旺仔牛奶"
        self.searchTitleView.clickSearchBlock = { words in
//            self.requestHotWords(words: words as String)
        }
        let rightItem : UIBarButtonItem = UIBarButtonItem.init(image: (UIImage(named: "ww_homes_cart_white_btn_img")?.withRenderingMode(.alwaysOriginal)), style: .plain, target: self, action: #selector(pushToCartVC))
        self.navigationItem.rightBarButtonItem = rightItem
        self.view.addSubview(self.mainCollectionView)
    }
    @objc func pushToCartVC(){
        
    }
    
    @objc func headerRefresh(){
        self.indexPage = 0
        self.requestSearchResult(keyWord: self.searchTitleView.searchBar.text ?? "", currentPage: 1, pageSize: 12)
       }
       
       @objc func footerRefresh(){
           self.indexPage += 1
           self.requestGuessYourLike(page: self.indexPage)
       }
    
    lazy var mainCollectionView : UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView.init(frame: CGRect(x: 0, y: 0, width:WWScreenWidth , height: WWScreenHeight), collectionViewLayout: layout)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        view.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        view.register(WW_SearchResultProductsCell.classForCoder(), forCellWithReuseIdentifier: "productsCell")
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        view.contentSize = CGSize(width: WWScreenWidth,height: WWScreenHeight)
        
        //刷新
        header.setRefreshingTarget(self, refreshingAction:#selector(headerRefresh))
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        header.stateLabel?.textColor = UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1)
        
        view.mj_header = header
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        //        footer.isAutomaticallyRefresh = false
        footer.stateLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        footer.stateLabel?.textColor = UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1)
        view.mj_footer = footer
        return view
    }()
    
    lazy var emptyView : WW_NoDataView = {
        let v = WW_NoDataView()
        v.isHidden = true
        return v
    }()
}

extension WW_SearchResultVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (self.searchResultViewmodel.searchNoMore == true){
            return 2
        }else{
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 1){
            return self.searchResultViewmodel.guessLikeArray.count
        }else{
            return self.searchResultViewmodel.productsArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WW_SearchResultProductsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! WW_SearchResultProductsCell
        let model : WW_SearchProductsItem
        if(indexPath.section == 1){
            model = self.searchResultViewmodel.guessLikeArray[indexPath.item]
        }else{
            model  = self.searchResultViewmodel.productsArray[indexPath.item]
        }
        let str = model.listImages
        cell.productImageView.kf.setImage(with: URL.init(string: str ?? ""))
        cell.productImageView.kf.indicatorType = .activity
        cell.nameLabel.text = model.name
        cell.specLabel.text = model.displayName
        cell.saleCountLabel.text = model.sold
        cell.priceAndUnitLabel.text = "￥\(model.retailPrice ?? "")/\(model.unit ?? "")"
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (WWScreenWidth-10*2-10)/2, height: 305)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(14, 10, 0, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO JumpDetail
        debugPrint(indexPath.item)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section == 1){
            return CGSize(width: WWScreenWidth, height: 35)
        }else{
            if(self.searchResultViewmodel.productsArray.count < 1){
                return CGSize(width: WWScreenWidth, height: 280)
            }else{
                return CGSize(width: WWScreenWidth, height: 1)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headView : UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", for: indexPath)
       
        for view in headView.subviews{
            view.removeFromSuperview()
        }
        if(indexPath.section == 1){
            let headImageView = UIImageView()
            headImageView.image = UIImage(named: "ww_homes_cell_recommend_head_img")
            headView.addSubview(headImageView)
            headImageView.snp.makeConstraints { make in
                make.center.equalTo(headView)
            }
        }else{
            headView.addSubview(self.emptyView)

            self.emptyView.snp.makeConstraints { make in
                make.centerX.equalTo(headView)
                make.top.equalTo(130)
            }
        }
        return headView
    }
}

/**
 1.collectionview search result  && request
 2.collectionview guess you like && request
 3.same collectionviewcell
 */
