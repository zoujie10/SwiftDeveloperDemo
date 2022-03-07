//
//  WW_CustomerFiltrateTypeVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/24.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit

class WW_CustomerFiltrateTypeVC: WW_MainBaseVC {
    
    typealias confirmBlock = ([String:String]) -> Void
    var confirm_block : confirmBlock?
    
    let filtrateViewModel = WW_CustomerFiltrateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 0, g: 0, b: 0, a: 0.3)
        creatUI()
    }
    
    
    //MARK: UI
    func creatUI(){
        self.view.addSubview(self.bgView)
        bgView.layer.cornerRadius = 12
        self.bgView.frame = CGRect(x: 0, y: WWScreenHeight, width: WWScreenWidth, height: WWScreenHeight-200)
        UIView.animate(withDuration: 0.3) {
            self.bgView.frame.origin.y = 200
        }
        
        self.bgView.addSubview(self.titleLabel)
        self.bgView.addSubview(self.mainCollectionView)
        self.bgView.addSubview(self.resetBtn)
        self.bgView.addSubview(self.confirmBtn)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(bgView)
            make.top.equalTo(bgView).offset(15)
        }
        
        resetBtn.snp.makeConstraints { make in
            make.left.equalTo(bgView.snp_left).offset(35);
            make.height.equalTo(35);
            make.bottom.equalTo(bgView.snp_bottom).offset(-30)
        }
        
        confirmBtn.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.centerY.equalTo(resetBtn)
            make.width.equalTo(WWScreenWidth/2 + 50)
            make.right.equalTo(bgView.snp_right).offset(-20)
        }
        
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottom).offset(5)
            make.bottom.equalTo(confirmBtn.snp_top).offset(-10)
            make.left.right.equalTo(bgView)
        }
    }
    
    //MARK:lazy load
    lazy var bgView : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.white
        return v
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "选择查询条件"
        return label;
    }()

    lazy var mainCollectionView : UICollectionView = {
        let layout = WW_SearchHotWordsFlowLayout.init(with: .AlignWithLeft, betweenOfCell: 10)
        let view = UICollectionView.init(frame: CGRect(x: 0, y: 0, width:WWScreenWidth , height: WWScreenHeight), collectionViewLayout: layout)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        view.register(WW_CustomerChooseHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(WW_CustomerChooseHeaderView.classForCoder()))
        view.register(WW_CustomerChooseListCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(WW_CustomerChooseListCell.classForCoder()))
        view.register(WW_CustomerChooseListInputAmountAreaCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(WW_CustomerChooseListInputAmountAreaCell.classForCoder()))
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        view.contentSize = CGSize(width: WWScreenWidth,height: WWScreenHeight)
        return view
    }()
    
    
    lazy var confirmBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("确定", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(r: 252, g: 85, b: 108)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action: #selector(confirmMethod), for: .touchUpInside)
        return btn
    }()
    
    lazy var resetBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle(" 重置", for: .normal)
        btn.setImage(UIImage(named: "ww_customer_refresh_btn"), for: .normal)
        btn.setTitleColor(UIColor(r: 252, g: 85, b: 108), for: .normal)
        btn.addTarget(self, action: #selector(resetMethod), for: .touchUpInside)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        return btn
    }()
    
    //MARK:private method
    @objc func confirmMethod(){
        if self.confirm_block != nil{
           print(self.filtrateViewModel.confirmData())
            self.confirm_block!(self.filtrateViewModel.confirmData())
        }
        removeVC()
    }
    func removeVC(){
        UIView.animate(withDuration: 0.3) {
            self.bgView.frame.origin.y = WWScreenHeight
        } completion: { Bool in
            self.removeFromParentViewController()
            self.view.removeFromSuperview()
        }
    }
    @objc func resetMethod(){
        self.filtrateViewModel.resetData()
        self.mainCollectionView.reloadData()
    }
    
    func showVC(){
        WW_keyWindow?.rootViewController?.addChildViewController(self)
        WW_keyWindow?.addSubview(self.view)
        self.view.bringSubview(toFront: self.bgView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        let touch = touches.first!
        let point = touch.location(in: view)
        let layer = self.view.layer.hitTest(point)
        if layer == self.view.layer{
            removeVC()
        }
    }
}
extension WW_CustomerFiltrateTypeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.filtrateViewModel.originFiltrateArray.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filtrateViewModel.originFiltrateArray[section].itemsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 2{
            let cell : WW_CustomerChooseListInputAmountAreaCell =  collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(WW_CustomerChooseListInputAmountAreaCell.classForCoder()), for: indexPath) as! WW_CustomerChooseListInputAmountAreaCell
            return cell
        }else{
            let cell : WW_CustomerChooseListCell =  collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(WW_CustomerChooseListCell.classForCoder()), for: indexPath) as! WW_CustomerChooseListCell
            let model : WW_CustomerFiltrateItemModel = self.filtrateViewModel.originFiltrateArray[indexPath.section].itemsArray[indexPath.row]
            cell.titleLabel.text = model.titile
            cell.configSelect(isSelect: model.isSelect)
           
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView =  collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: NSStringFromClass(WW_CustomerChooseHeaderView.classForCoder()), for: indexPath) as! WW_CustomerChooseHeaderView
        headerView.sectionTitleLabel.text  = self.filtrateViewModel.originFiltrateArray[indexPath.section].sectionTitle
        return headerView
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: WWScreenWidth, height: 49)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 2{
            return CGSize(width: WWScreenWidth, height: 50)
        }else{
            let width = (WWScreenWidth - 24*2 - 8*3)/3
            let size = CGSize(width: width, height: 25/72*width)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let model : WW_CustomerFiltrateItemModel = self.filtrateViewModel.originFiltrateArray[indexPath.section].itemsArray[indexPath.row]
        if model.isSelect == true {
            return
        }

        for model : WW_CustomerFiltrateItemModel in  self.filtrateViewModel.originFiltrateArray[indexPath.section].itemsArray{
            model.select = false
        }
        
        self.filtrateViewModel.originFiltrateArray[indexPath.section].itemsArray[indexPath.row].isSelect = true
        self.mainCollectionView.reloadData()
    }
}
