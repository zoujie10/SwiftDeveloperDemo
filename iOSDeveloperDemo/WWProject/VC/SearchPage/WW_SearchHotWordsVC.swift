//
//  WWSearchHotWordsVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/22.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import MapKit

class WW_SearchHotWordsVC: WW_MainBaseVC {

    var searchTitleView = WW_SearchTitleView()
    var searchViewmodel = WW_SearchViewModel()
    var historyWordsArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        requestHotWords(words: "牛奶")
        configUI()
    }
    func configUI(){
        self.navigationItem.titleView = self.searchTitleView
        self.searchTitleView.frame = CGRect(x: 0, y: 0, width: 270, height: 35)
        self.searchTitleView.searchWords = "旺仔牛奶"
        self.searchTitleView.clickSearchBlock = { words in
            self.requestHotWords(words: words as String)
        }
        self.view.addSubview(self.mainCollectionView)
    
    }
    
    
    lazy var mainCollectionView : UICollectionView = {
        let layout = WW_SearchHotWordsFlowLayout.init(with: .AlignWithLeft, betweenOfCell: 10)
        let view = UICollectionView.init(frame: CGRect(x: 0, y: 0, width:WWScreenWidth , height: WWScreenHeight), collectionViewLayout: layout)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]

        view.register(UICollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        view.register(WW_SearchHotWordsCollectionCell.classForCoder(), forCellWithReuseIdentifier: "hotWordsCell")
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        view.contentSize = CGSize(width: WWScreenWidth,height: WWScreenHeight)
        return view
    }()
}

extension WW_SearchHotWordsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if (self.historyWordsArray.count > 0){
            return 2
        }
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (section == 1){
            return self.historyWordsArray.count
        }else{
            return self.searchViewmodel.wordsArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WW_SearchHotWordsCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotWordsCell", for: indexPath) as! WW_SearchHotWordsCollectionCell
        
        if (indexPath.section == 0){
            let model = self.searchViewmodel.wordsArray[indexPath.item] as WW_SearchHotWordsItem
            cell.nameLabel.text = model.name
            if(model.isHighlight == "1"){
                cell.nameLabel.textColor = .red
                cell.contentView.backgroundColor = .white
            }else{
                cell.nameLabel.textColor = .lightGray
                cell.contentView.backgroundColor = UIColor(r: 252, g: 250, b: 250)
            }
            cell.deleteBtn.isHidden = true
        }else{
            cell.nameLabel.text = self.historyWordsArray[indexPath.item] as? String
            cell.nameLabel.textColor = .lightGray
            cell.contentView.backgroundColor = UIColor(r: 252, g: 250, b: 250)
            
            cell.clickBlock = {
                
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 30)//TODO
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headView : UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", for: indexPath)
       
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        headView.addSubview(sectionTitleLabel)
        sectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(headView).offset(18)
            make.left.equalTo(20)
        }
        if(indexPath.section == 0){
            sectionTitleLabel.text = "热门搜索"
        }else if (indexPath.section == 1){
            sectionTitleLabel.text = "历史搜索"
//            let deleteBtn = UIButton()
        }
        return headView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: WWScreenWidth, height: 50)
    }
    
    func requestHotWords(words : String){
        self.searchViewmodel.getHotWordsRequest()
        self.searchViewmodel.datahotWordsComplete = {
            self.mainCollectionView.reloadData()
        }
    }
    
    func requestAssociationalWord(word : String){
        
    }
    
}
//结构
/**
 1.collectionview
 2.自定义layout ， cell 根据内容算宽度
 3.2 section ： section 1  hotwords  by request， section 2  history words by userdefault (manager history userDefault) ,clear button
 4.联想词界面 tableview  + request
 */
