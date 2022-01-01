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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configUI()
    }
    func configUI(){
        self.navigationItem.titleView = self.searchTitleView
        self.searchTitleView.frame = CGRect(x: 0, y: 0, width: 270, height: 35)
        self.searchTitleView.searchWords = "旺仔牛奶"
    }
    
    
    lazy var mainCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView.init(frame: CGRect(x: 0, y: 0, width:WWScreenWidth , height: WWScreenHeight), collectionViewLayout: layout)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        view.register(UICollectionReusableView.classForCoder(), forCellWithReuseIdentifier: "headView")
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : WW_SearchHotWordsCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "hotWordsCell", for: indexPath) as! WW_SearchHotWordsCollectionCell
        return cell
    }
    
   
    func requestHotWords(words : String){
        
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
