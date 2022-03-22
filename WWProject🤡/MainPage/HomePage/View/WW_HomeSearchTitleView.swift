//
//  WW_HomeSearchTitleView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/3/22.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_HomeSearchTitleView: UIView {

    var searchTextfield : UITextField?
    
    var searchWords : String {
        set (searchWord){
            self.searchBar.text = searchWord
        }
        get {
            return self.searchBar.text ?? ""
        }
    }
    var isJ = false
    var onOnlyJump : Bool {

        set (isJump){
            isJ = isJump
            searchTextfield?.clearButtonMode = .never
        }
        
        get {
            return isJ
        }
    }
    
    typealias clickSearchBarBlock = (_ serchText : NSString) -> Void
    var clickSearchBlock : clickSearchBarBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
//        self.backgroundColor = UIColor(r: 252, g: 85, b: 108)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI(){
        self.addSubview(self.searchBar)
        self.searchBar.addSubview(self.titleScrollView)
    }
    
    func updateByData(itemData : WW_HomeItemDetailModel){
        titleScrollView.dataSource = (itemData.tips?.components(separatedBy: "/"))!
        titleScrollView.scrollTableView.reloadData()
    }
    
    lazy var searchBar : UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "请输入搜索内容"
        bar.returnKeyType = .search
        bar.backgroundImage = UIImage()
        bar.isUserInteractionEnabled = false
        let textfield : UITextField = bar.value(forKey: "searchField") as! UITextField
        textfield.font = UIFont.systemFont(ofSize: 13)
        textfield.backgroundColor = .clear
        textfield.textColor = UIColor(r: 163, g: 163, b: 163)
        textfield.enablesReturnKeyAutomatically = false

        let leftImageView = UIImageView.init(frame: CGRect(x: 10, y: 5, width: 12, height: 12))
        leftImageView.image = UIImage(named: "ww_ceos_acting_search_btn_img")
        leftImageView.contentMode = .center

        let leftPaddingView = UIView.init(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        leftPaddingView.addSubview(leftImageView)
        textfield.leftView = leftPaddingView

        let clearBtn : UIButton = textfield.value(forKey: "_clearButton") as! UIButton
        clearBtn.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        clearBtn.setImage(UIImage(named: "ww_search_clear_btn_img"), for: .normal)
        clearBtn.setImage(UIImage(named: "ww_search_clear_btn_img"), for: .highlighted)

        bar.frame = CGRect(x: 0, y: 0, width: 270, height: 35)
        bar.layer.cornerRadius = 16
        bar.backgroundColor = .white
        
        searchTextfield = textfield
        return bar
    }()
    
    lazy var titleScrollView : WW_TextScrollView = {
        let v = WW_TextScrollView()
        return v
    }()
}



