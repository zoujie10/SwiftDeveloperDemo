//
//  SwiftAnimationSoundVideoVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/7.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftAnimationSoundVideoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "动画音频视频"
        //1.动画
        //1.1 UIView动画
//        uiviewAnimationMethod()
       
        //1.2 UIImageView播放帧
        uiimageviewAnimation()
       
        //1.3 位移关键帧动画
        
        //2.音频播放
        //2.1 Sysetm Sound Services 简短声音
        //2.2 AVAudioPlayer 播放音乐
        
        //3.视频播放
        //3.1 AVPlayer播放影片
        //3.1 影片的画中画功能
    }
    
    func uiviewAnimationMethod(){
        let view = UIView()
        view.backgroundColor = .orange
        view.alpha = 1
        
        self.view.addSubview(self.animationView)
        self.animationView.snp.makeConstraints {
            $0.center.equalTo(self.view)
            $0.width.height.equalTo(200)
        }
        self.view.addSubview(self.blueAnimationView)
        self.blueAnimationView.snp.makeConstraints {
            $0.bottom.equalTo(self.animationView.snp_top).offset(-20)
            $0.width.height.equalTo(200)
            $0.centerX.equalTo(self.animationView)
        }
        
        let button = UIButton()
        button.setTitle("Animation", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(animationMethod), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalTo(self.animationView.snp_bottom).offset(20)
            $0.centerX.equalTo(self.animationView)
        }
    }
    
    lazy var animationView : UIView = {
       let animationView = UIView()
        animationView.backgroundColor = .orange
        animationView.alpha = 1
        return animationView
    }()
    
    lazy var blueAnimationView : UIView = {
        let blueAnimationView = UIView()
        blueAnimationView.backgroundColor = .blue
        return blueAnimationView
    }()
    
    @objc func animationMethod(){
//        UIView.animate(withDuration: 2) {
//            self.animationView.alpha = 0.5
//        }
        
        UIView.transition(from: self.blueAnimationView, to: self.animationView, duration: 3, options: .curveLinear) { _ in
            
        }
//        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModeCubic) {
//
//        } completion: { _ in
//
//        }

    }

    func uiimageviewAnimation(){

        let imageView = UIImageView()
        imageView.animationImages = [UIImage(named: "ww_imgs_refresh_footer_img_1")!,
                                     UIImage(named: "ww_imgs_refresh_footer_img_2")!,
                                     UIImage(named: "ww_imgs_refresh_footer_img_3")!,
                                     UIImage(named: "ww_imgs_refresh_footer_img_4")!]
//        imageView.animationRepeatCount = 5
        imageView.animationDuration = 1
        self.view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.center.equalTo(self.view)
            $0.width.height.equalTo(100)
        }
        imageView.startAnimating()
    }
}
