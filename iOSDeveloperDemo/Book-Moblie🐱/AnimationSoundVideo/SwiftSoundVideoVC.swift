//
//  SwiftSoundVideoVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/10.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftSoundVideoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "音频-视频"
        //2.音频播放
        studySoundMethod()
        //2.1 Sysetm Sound Services 简短声音
        //2.2 AVAudioPlayer 播放音乐
        
        //3.视频播放
        studyVideoMethod()
        //3.1 AVPlayer播放影片
        //3.1 影片的画中画功能
    }
    
    func studySoundMethod(){
        self.view.addSubview(self.clickSoundBtn)
        self.view.addSubview(self.clickSystemSoundBtn)
        
        self.clickSystemSoundBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.view).offset(100)
            
        }
        self.clickSoundBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.clickSystemSoundBtn.snp_bottom).offset(20)
        }
    }
    
    func studyVideoMethod(){
        self.view.addSubview(self.clickVideoBtn)
        self.clickSoundBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.clickSoundBtn.snp_bottom).offset(20)
        }
    }
    
    
    @objc func clickSystemSound(){
        //2.1 Sysetm Sound Services 简短声音 音效
        /**
         
         */
       
    }
    @objc func clickSound(){
        //2.2 AVAudioPlayer 播放音乐
        /**
         
         */
    }
    @objc func clickVideo(){
        //3.1 AVPlayer播放影片
        //3.1 影片的画中画功能
    }
    lazy var clickSystemSoundBtn : UIButton = {
        let clickSystemSoundBtn = UIButton()
        clickSystemSoundBtn.setTitle("系统声音", for: .normal)
        clickSystemSoundBtn.setTitleColor(.black, for: .normal)
        clickSystemSoundBtn.addTarget(self, action: #selector(clickSystemSound), for: .touchUpInside)
        clickSystemSoundBtn.backgroundColor = .red
        clickSystemSoundBtn.setTitleColor(.white, for: .normal)
        return clickSystemSoundBtn
    }()
    
    lazy var clickSoundBtn : UIButton = {
        let clickSoundBtn = UIButton()
        clickSoundBtn.setTitle("播放音乐", for: .normal)
        clickSoundBtn.setTitleColor(.black, for: .normal)
        clickSoundBtn.addTarget(self, action: #selector(clickSound), for: .touchUpInside)
        clickSoundBtn.backgroundColor = .red
        clickSoundBtn.setTitleColor(.white, for: .normal)
        return clickSoundBtn
    }()
    
    lazy var clickVideoBtn : UIButton = {
        let clickVideoBtn = UIButton()
        clickVideoBtn.setTitle("播放视频", for: .normal)
        clickVideoBtn.setTitleColor(.black, for: .normal)
        clickVideoBtn.addTarget(self, action: #selector(clickVideo), for: .touchUpInside)
        clickVideoBtn.backgroundColor = .red
        clickVideoBtn.setTitleColor(.white, for: .normal)
        return clickVideoBtn
    }()
}
