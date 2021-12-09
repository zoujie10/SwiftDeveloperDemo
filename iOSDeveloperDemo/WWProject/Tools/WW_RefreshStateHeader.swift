//
//  WW_RefreshStateHeader.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/12/8.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import MJRefresh

class WW_RefreshStateHeader: MJRefreshGifHeader {
    

    override func prepare() {
        super.prepare()
        setImages([UIImage(named: "ww_classifys_pulldown_updata_arrow")!], for: .idle)
        setImages([UIImage(named: "ww_classifys_pulldown_updata_arrow")!], for: .pulling)
        setImages([UIImage(named: "ww_classifys_pulldown_updata_arrow")!], for: .refreshing)
        lastUpdatedTimeLabel?.isHidden = true
    }
    
    func configRefreshContext(title : String){
        setImages([UIImage(named: "ww_classifys_pulldown_updata_arrow")!], for: .idle)
        setImages([UIImage(named: "ww_classifys_pulldown_updata_arrow")!], for: .pulling)
        setImages([UIImage(named: "ww_classifys_pulldown_updata_arrow")!], for: .refreshing)//重新设置图片  刷新和文本间距
        self.setTitle(title, for: .idle)
        self.setTitle(title, for: .pulling)
        self.setTitle(title, for: .refreshing)
    }

}
