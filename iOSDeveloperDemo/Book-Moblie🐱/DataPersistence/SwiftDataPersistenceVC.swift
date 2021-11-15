//
//  SwiftDataPersistenceVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/7.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftDataPersistenceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "数据持久化"
        //1.plist文件
        //1.1 创建和解析plist文件
        
        //1.2 信息写入plist文件
        
        //2.CoreData 数据持久化
        
        //2.1 插入数据
        //2.2 检索数据
        //2.3 修改和删除
        
        view.addSubview(self.parsePlistBtn)
        view.addSubview(self.writePlistBtn)
        view.addSubview(self.coreDataAddBtn)
        view.addSubview(self.coreDataAlterBtn)
        view.addSubview(self.coreDataDeleteBtn)
        view.addSubview(self.coreDataQueryBtn)
        
        self.parsePlistBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(100)
        }
        
        self.writePlistBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(self.parsePlistBtn.snp_bottom).offset(20)
        }
        
        self.coreDataAddBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(self.writePlistBtn.snp_bottom).offset(20)
        }
        self.coreDataDeleteBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(self.coreDataAddBtn.snp_bottom).offset(20)
        }
        self.coreDataAlterBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(self.coreDataDeleteBtn.snp_bottom).offset(20)
        }
        self.coreDataQueryBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(self.coreDataAlterBtn.snp_bottom).offset(20)
        }
        
    }
    var mutArray = NSMutableArray()
    //1.1 创建和解析plist文件
    @objc func parsePlist(){
        let plistPath = Bundle.main.path(forResource: "SwiftTestModel", ofType: "plist")
        let url : URL = URL.init(fileURLWithPath: plistPath!)
        let data : NSArray = NSArray(contentsOf: url)!//MARK:root array
//        mutArray = NSMutableArray(contentsOfFile: plistPath!)!
    
        let array : NSArray = data.firstObject as! NSArray
        let dic : NSDictionary = array[1] as! NSDictionary
        let value : String = dic.object(forKey: "key") as! String
        let value2 : String = dic.object(forKey: "key2") as! String
        debugPrint(value,value2)
    }
    //1.2 信息写入plist文件
    @objc func writePlist(){
        let dic : NSMutableDictionary = NSMutableDictionary()
        dic.setObject("value1", forKey: "key1" as NSCopying)
        dic.setObject("value2", forKey: "key2" as NSCopying)
        
        //往已存在的plist文件写入数据 在项目根目录里
        let plistPath : String = Bundle.main.path(forResource: "SwiftTestModel", ofType: "plist")!
        dic.write(toFile: plistPath, atomically: true)
        
        let readDic : NSDictionary = NSDictionary(contentsOfFile: plistPath)!
        print(plistPath)///Users/zoujie/Library/Developer/CoreSimulator/Devices/1C44DCCE-EAC6-4AE1-A938-945CE1ACF43A/data/Containers/Bundle/Application/F5074C5D-95EE-436D-AF64-F3EF914D07D0/iOSDeveloperDemo.app/SwiftTestModel.plist
        print(readDic)
    }
    
    lazy var parsePlistBtn : UIButton = {
        let parsePlistBtn = UIButton()
        parsePlistBtn.setTitle("解析plist", for: .normal)
        parsePlistBtn.setTitleColor(.black, for: .normal)
        parsePlistBtn.addTarget(self, action: #selector(parsePlist), for: .touchUpInside)
        return parsePlistBtn
    }()
    
    lazy var writePlistBtn : UIButton = {
        let writePlistBtn = UIButton()
        writePlistBtn.setTitle("写入数据plist", for: .normal)
        writePlistBtn.setTitleColor(.black, for: .normal)
        writePlistBtn.addTarget(self, action: #selector(writePlist), for: .touchUpInside)
        return writePlistBtn
    }()
    
    //2.1 插入数据
    //存入分类商品model列表    left array --tagId key --> right array[model] -- ZJ_ProductsModel
    //2.2 检索数据
    //2.3 修改和删除
    @objc func writeCoreData(){
        
        
        
    }
    @objc func deleteCoreData(){
        
    }
    @objc func alterCoreData(){
        
    }
    @objc func queryCoreData(){
        
    }
    
    lazy var coreDataAddBtn : UIButton = {
        let coreDataAddBtn = UIButton()
        coreDataAddBtn.setTitle("写入数据 CoreData", for: .normal)
        coreDataAddBtn.setTitleColor(.black, for: .normal)
        coreDataAddBtn.addTarget(self, action: #selector(writeCoreData), for: .touchUpInside)
        return coreDataAddBtn
    }()
    
    lazy var coreDataDeleteBtn : UIButton = {
        let coreDataDeleteBtn = UIButton()
        coreDataDeleteBtn.setTitle("删除数据 CoreData", for: .normal)
        coreDataDeleteBtn.setTitleColor(.black, for: .normal)
        coreDataDeleteBtn.addTarget(self, action: #selector(deleteCoreData), for: .touchUpInside)
        return coreDataDeleteBtn
    }()
    
    lazy var coreDataAlterBtn : UIButton = {
        let coreDataAlterBtn = UIButton()
        coreDataAlterBtn.setTitle("修改数据 CoreData", for: .normal)
        coreDataAlterBtn.setTitleColor(.black, for: .normal)
        coreDataAlterBtn.addTarget(self, action: #selector(alterCoreData), for: .touchUpInside)
        return coreDataAlterBtn
    }()
    
    lazy var coreDataQueryBtn : UIButton = {
        let coreDataQueryBtn = UIButton()
        coreDataQueryBtn.setTitle("查询数据 CoreData", for: .normal)
        coreDataQueryBtn.setTitleColor(.black, for: .normal)
        coreDataQueryBtn.addTarget(self, action: #selector(queryCoreData), for: .touchUpInside)
        return coreDataQueryBtn
    }()
}
