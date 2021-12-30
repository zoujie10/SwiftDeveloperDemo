//
//  WW_SearchTitleView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/30.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class WW_SearchTitleView: UIView,UISearchBarDelegate {

    var searchWords : NSString = ""
    
    typealias clickSearchBarBlock = () -> NSString
    var clickSearchBlock : clickSearchBarBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        self.backgroundColor = UIColor(r: 252, g: 85, b: 108)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI(){
        self.addSubview(self.searchBar)
        self.searchBar.snp.makeConstraints { make in
            make.top.equalTo(self).offset(12)
        }
    }
    
    lazy var searchBar : UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "请输入搜索内容"
        bar.returnKeyType = .search
        bar.backgroundImage = UIImage()
        
        let textfield : UITextField = bar.value(forKey: "seearchField") as! UITextField
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
        bar.delegate = self
        bar.layer.cornerRadius = 16
        bar.backgroundColor = .white
        
        searchTextfield = textfield
        return bar
    }()
    
    lazy var searchTextfield : UITextField = {
        let textfield = UITextField()
        return textfield
    }()
}
