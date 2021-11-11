//
//  SwiftSoundVideoVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/10.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import AudioToolbox

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
         1.播放的声音长度要小于30s
         2.声音文件的格式必须是PCM或IMA4
         3.无法控制音频播放的进度
         4.调用方法后立即播放声音，并且无法设置声音大小
         5.无法进行循环播放或立体声播放的控制
         6.可以调用系统的振动功能
         */
        var _soundId : SystemSoundID = 0
        let path = Bundle.main.path(forResource: "pop_drip", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL,&_soundId)
       //监听音频完成
        AudioServicesAddSystemSoundCompletion(_soundId, nil, nil, { (soundID, clientData) -> Void in
            print("音频播放之后，重复播放。。。")
//            AudioServicesPlaySystemSound(soundID)
        },nil)
        AudioServicesPlaySystemSound(_soundId)//调用音频的播放
    }
    @objc func clickSound(){
        //2.2 AVAudioPlayer 播放音乐
        /**
         1.播放任意时长的音频文件
         2.播放文件中或者内存缓存区中的声音
         3.进行音频文件的循环播放
         4.使用多个AVAudioPlayer实例可以同时播放多个音频文件
         5.控制播放的音量，设置立体声，还可以设置播放中声音的速率
         6.支持进行声音播放的快进和后退
         */
        
        //Audio Queue Services可以完全实现对声音的控制,可以将声音数据从文件中读取到内存缓冲区,并对声音数据进行特殊处理,比如进行声音的快进,慢速播放,或者改变声音音色.
        //Open AL 是一个跨平台的开源音频处理接口，为音频播放提供了一套更加底层，精细的方案，特别适合具有复杂音频使用场景的游戏开发。
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
