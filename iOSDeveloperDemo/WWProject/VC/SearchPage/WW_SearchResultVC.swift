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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 247, g: 247, b: 247)
        self.searchResultViewmodel.getSearchWords(serchWord: "牛奶", currentPage: 1, pageSize: 1)
        self.searchResultViewmodel.dataResultComplete = {
            self.mainCollectionView.reloadData()
        }
        configUI()
    }
   
    func configUI(){
        self.navigationItem.titleView = self.searchTitleView
        self.searchTitleView.frame = CGRect(x: 0, y: 0, width: 270, height: 35)
        self.searchTitleView.searchWords = "旺仔牛奶"
        self.searchTitleView.clickSearchBlock = { words in
//            self.requestHotWords(words: words as String)
        }
        self.view.addSubview(self.mainCollectionView)
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
        
        //TODO 上啦下拉刷新
        return view
    }()
}

extension WW_SearchResultVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.searchResultViewmodel.productsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WW_SearchResultProductsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! WW_SearchResultProductsCell
        
        let model : WW_SearchProductsItem = self.searchResultViewmodel.productsArray[indexPath.item]
        let str = model.listImages
        cell.productImageView.kf.setImage(with: URL.init(string: str ?? ""))
        cell.productImageView.kf.indicatorType = .activity
        cell.nameLabel.text = model.name
        cell.specLabel.text = model.displayName
        cell.saleCountLabel.text = model.sold
        cell.priceAndUnitLabel.text = "\(model.retailPrice ?? "")/\(model.unit ?? "")"
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
}

/**
 1.collectionview search result  && request
 2.collectionview guess you like && request
 3.same collectionviewcell
 */
