//
//  WW_HomeSecondKillCell.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/30.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
//秒杀
class WW_HomeSecondKillCell: WW_HomeBaseCell {
    
    typealias countDownEndBlock = () -> Void
    var countDown_block : countDownEndBlock?
    
    var interval : TimeInterval = 0
    var startToEndInterval : TimeInterval = 0
    var statusString : String = ""
    
    override func initContentView(){
        super.initContentView()
        self.setUpSubviews()
    }
    
    func setUpSubviews(){
        contentView.addSubview(imageView)
        contentView.addSubview(leftImageView)
        contentView.addSubview(rightImageView)
        contentView.addSubview(timeLabel)
        
        imageView.snp.makeConstraints { make in
            make.margins.equalTo(UIEdgeInsets.init(top: 5, left: 15, bottom: 5, right: 15))
        }
        
        leftImageView.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(15)
            make.left.equalTo(imageView).offset(18)
            make.size.equalTo(CGSize.init(width: 70, height: 20))
        }
        
        rightImageView.snp.makeConstraints { make in
            make.centerY.equalTo(leftImageView)
            make.right.equalTo(imageView).offset(-18)
            make.size.equalTo(CGSize.init(width: 70, height: 20))
        }
        
        timeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(leftImageView)
            make.left.equalTo(leftImageView.snp_right).offset(10)
        }
        
    }
    
    override func updateData(itemData: WW_HomeItemModel) {
        self.detailModelArray = NSArray.init(array: itemData.configureAttribute!) as! [WW_HomeItemDetailModel]
        imageView.kf.setImage(with: URL.init(string: itemData.pictureURL!))
        imageView.kf.indicatorType = .activity
        
        leftImageView.kf.setImage(with: URL.init(string: itemData.actPictureURL!))
        leftImageView.kf.indicatorType = .activity
        
        rightImageView.kf.setImage(with: URL.init(string: itemData.morePictureURL!))
        rightImageView.kf.indicatorType = .activity
        
        start()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if #available(iOS 15, *) {
            let currentDate = Date.now
            let startDate = formatter.date(from: itemData.startTime!)
            let endDate = formatter.date(from: itemData.endTime!)
            let startInterval = startDate?.timeIntervalSince(currentDate)
            let endInterval = endDate?.timeIntervalSince(currentDate)
//            startInterval = endDate?.timeIntervalSince(startDate)
            
            if startInterval! > 0{
                statusString = "距开始"
                self.interval = startInterval!
            }else if endInterval! > 0{
                statusString = "距结束"
                self.interval = endInterval!
            }else{
                self.timeLabel.text = "距结束 00 : 00 : 00";
            }
        } else {
            
        }
    }
    func start(){
        RunLoop.main.add(timer, forMode: .commonModes)
    }
    func stop(){
        timer.invalidate()
    }
    
    @objc func tapAction(){
        let model : WW_HomeItemDetailModel =  self.detailModelArray.first!
        self.itemLinkType = WWBHomeItemLinkType.init(rawValue: Int(model.linkPOP?.type! ?? "0")!)!
        self.itemLinkSubType = WWBHomeItemLinkSubType.init(rawValue: Int(model.linkPOP?.content! ?? "0")!)!
        self.cellAction_block!(self.itemLinkType,self.itemLinkSubType)
    }
    
    @objc func countDown(){
        interval += 1
        let day = self.interval / (24 * 3600)
        let hour = (self.interval - day * (24 * 3600)) / 3600
        let minute = (self.interval - day * (24 * 3600) - hour * 3600) / 60
        let second = self.interval - day * (24 * 3600) - hour * 3600 - minute * 60
        let timeString = (statusString+"\(day * 24 + hour)"+"\(minute)"+"\(second)")
        timeLabel.text = timeString
        if day <= 0 && hour <= 0 && minute <= 0 && second <= 0{
            if statusString == "距开始"{
                statusString = "距结束"
            }else{
                stop()
                if self.countDown_block != nil{
                    self.countDown_block!()
                }
            }
        }
    }
    
    lazy var timer : Timer = {
        let t = Timer.init(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: (Any).self, repeats: true)
        return t
    }()
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        imageView.addGestureRecognizer(tap)
        return imageView
    }()
    
    lazy var leftImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    lazy var rightImageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    lazy var timeLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label;
    }()
}
