//
//  SwiftSoundVideoVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/10.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFAudio
import AVFoundation
import AVKit

class SwiftSoundVideoVC: UIViewController,AVAudioPlayerDelegate {

    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
    var avPlayer : AVPlayer = AVPlayer()
    var playerItem: AVPlayerItem?
    var playerController: AVPlayerViewController!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.hidesBottomBarWhenPushed = true
        self.view.backgroundColor = .white
        self.title = "音频-视频"
        //2.音频播放
        studySoundMethod()
        //2.1 Sysetm Sound Services 简短声音
        //2.2 AVAudioPlayer 播放音乐
        studyMusicMethod()
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
    func studyMusicMethod(){
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
        let path = Bundle.main.path(forResource: "宇宙骑士reason", ofType: "mp3")
        let soundId = URL(fileURLWithPath: path!)
        
        do{
            try audioPlayer = AVAudioPlayer(contentsOf: soundId)//指定路径加载音频文件
            audioPlayer.volume = 1.0 //音量
            audioPlayer.delegate = self
            audioPlayer.numberOfLoops = 0 //循环播放次数 -1 无限循环  1 播放完会日志输出播放完毕
//            audioPlayer.pan = 0 立体声平移位置，-1.0完全左声道，0.0左右声道平衡 1.0完全右声道
//            audioPlayer.numberOfChannels 声道数
//            audioPlayer.duration 音频的总长度，单位为s
//            audioPlayer.currentTime 当前播放位置的时间点，单位为s
//            audioPlayer.prepareToPlay() 音频加载到缓冲区，为音频播放准备
//            audioPlayer.play(atTime: <#T##TimeInterval#>) 指定的位置开始音频文件的播放
//            audioPlayer.stop()停止音频
            
        }catch{
            print(error)
        }
        
    }
    func studyVideoMethod(){
        self.view.addSubview(self.clickVideoBtn)
        self.clickVideoBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.clickSoundBtn.snp_bottom).offset(20)
        }
        self.view.addSubview(self.picInPicVideoBtn)
        self.picInPicVideoBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(self.clickVideoBtn.snp_bottom).offset(20)
        }
        
        let moviePath = Bundle.main.path(forResource: "VRTM-329", ofType: "mp4")
        let movieRUL = URL(fileURLWithPath: moviePath!)
        
        self.avPlayer = AVPlayer(url: movieRUL as URL)
       
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
        //<https://blog.csdn.net/qq_18505715/article/details/79868677>
    }
    @objc func clickSound(){
      
        
        if(self.audioPlayer.isPlaying){//是否处于播放状态
            self.audioPlayer.pause()//暂停
        }else{
            self.audioPlayer.play()
            debugPrint("\(self.audioPlayer.currentTime)----\(self.audioPlayer.deviceCurrentTime)---\(self.audioPlayer.rate)-----\(self.audioPlayer.duration)")
        }
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("audioPlayerDidFinishPlaying ---\(player)----\(flag)")
    }
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        print("BeginInterruption ---- \(player)")
    }
    
    @objc func clickVideo(){
        //3.1 AVPlayer播放影片
        let avPlayerLayer = AVPlayerLayer(player: self.avPlayer)
        avPlayerLayer.frame = self.view.bounds
        //resizeAspect 在视频层的显示范围内缩放视频大小，以保持视频的原始宽高比
        //resizeAspectFill 保留视频的宽高比，并对视频进行缩放，以填满层的范围区域
        //resize 将视频内容拉伸来匹配视频层的显示范围
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        
        self.view.layer.addSublayer(avPlayerLayer)
        self.avPlayer.play()
        
    }
    
    @objc func clickpicInPicVideo(){
        //3.1 影片的画中画功能
        let moviePath = Bundle.main.path(forResource: "movie", ofType: "mp4")//本地文件
        let movieURL = URL(fileURLWithPath: moviePath!)
        
        playerController = AVPlayerViewController()
        playerItem = AVPlayerItem(url: movieURL)
        playerController.player = AVPlayer(playerItem: playerItem)
        //            playerController.videoGravity = .resizeAspectFill
        playerController.view.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 350)
//        playerController.allowsPictureInPicturePlayback = true
//        playerController.showsPlaybackControls = true
        view.addSubview(playerController.view)
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
        clickSoundBtn.setTitle("播放/暂停 音乐", for: .normal)
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
    
    lazy var picInPicVideoBtn : UIButton = {
        let picInPicVideoBtn = UIButton()
        picInPicVideoBtn.setTitle("画中画视频", for: .normal)
        picInPicVideoBtn.setTitleColor(.black, for: .normal)
        picInPicVideoBtn.addTarget(self, action: #selector(clickpicInPicVideo), for: .touchUpInside)
        picInPicVideoBtn.backgroundColor = .red
        picInPicVideoBtn.setTitleColor(.white, for: .normal)
        return picInPicVideoBtn
    }()
    
}
