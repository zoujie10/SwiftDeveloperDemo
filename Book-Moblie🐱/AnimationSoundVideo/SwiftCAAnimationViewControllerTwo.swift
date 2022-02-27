//
//  SwiftCAAnimationViewControllerTwo.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/2/8.
//  Copyright © 2022 Zoujie. All rights reserved.
//

//点赞动画效果： 1.伸缩效果 2.离子火花
//侧边栏动画效果： 1.弹出膜层 2.弹层边缘弹簧效果 3.弹层内部空间弹簧效果
import UIKit

class SwiftCAAnimationViewControllerTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "侧滑栏/点赞"
        view.backgroundColor = UIColor.white
        creatUI()
        explosion()
    }
    func creatUI(){
        self.view.addSubview(self.clickBtn)
        self.clickBtn.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        self.view.addSubview(self.sortBtn)
        self.sortBtn.snp.makeConstraints { make in
            make.top.equalTo(self.clickBtn.snp_bottom).offset(100)
            make.centerX.equalTo(self.clickBtn)
        }
        
        self.view.addSubview(self.animationLayerBtn)
        self.animationLayerBtn.snp.makeConstraints { make in
            make.top.equalTo(self.sortBtn.snp_bottom).offset(100)
            make.centerX.equalTo(self.sortBtn)
        }
        
        let cubeView = SwiftCubeDisplayView()
        self.view.addSubview(cubeView)
        cubeView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.width.height.equalTo(100)
            make.bottom.equalTo(self.clickBtn.snp_top).offset(-100)
        }
    }
    //添加爆炸效果
    func explosion(){
        self.emitterLayer.frame = self.clickBtn.bounds
        self.emitterLayer.emitterPosition = CGPoint(x: self.emitterLayer.frame.width+10, y: self.emitterLayer.frame.size.height+10)//MARK: ？ 为毛不准 偏左上角
        self.clickBtn.layer.addSublayer(self.emitterLayer)
    }
    func addExplosionAnim(){
        self.emitterLayer.beginTime = CACurrentMediaTime()
        self.emitterLayer.birthRate = 1
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.emitterLayer.birthRate = 0;
        }
    }
    @objc func changeImage(sender : UIButton){
        sender.isSelected = !sender.isSelected
        //关键帧动画
        let anim = CAKeyframeAnimation.init(keyPath: "transform.scale")
        if sender.isSelected{
            anim.values = [2,0.8,1,1.2,1]
            anim.duration = 0.6
            addExplosionAnim()
        }else{
            anim.values = [0.8,1.0]
            anim.duration = 0.4
        }
        sender.layer.add(anim, forKey: nil)
    }
    
    @objc func jumpVC(){
        let vc = SwiftSelectAndSortVC()
        vc.showVC()
    }
    @objc func jumpAnimationVC(){
        let mune =  SwiftSlideAnimationMuneView.init(stringTitles:["1","2","3","4"])
        mune.switchAction()
    }
    
    lazy var clickBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "animation_click_default"), for: .normal)
        btn.setImage(UIImage(named: "animation_click_select"), for: .selected)
        btn.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
        return btn
    }()

    lazy var sortBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("弹层", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(jumpVC), for: .touchUpInside)
        return btn
    }()

    lazy var animationLayerBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("动画layer弹层", for: .normal)
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(jumpAnimationVC), for: .touchUpInside)
        return btn
    }()
    
    lazy var emitterLayer : CAEmitterLayer = {
        let layer = CAEmitterLayer.init()
        let cell = CAEmitterCell.init()
        cell.name = "explosionCell"
        cell.lifetime = 0.7;
        cell.birthRate = 4000;
        cell.velocity = 50;//中间值
        cell.velocityRange = 15;//(50+-15)
        cell.scale = 0.05;
        cell.scaleRange = 0.02;
        cell.contents = UIImage(named: "animation_sparkle_cell")?.cgImage
        //设置粒子系统大小，位置，方向
        layer.name = "explosionLayer"
        layer.emitterShape = kCAEmitterLayerCircle
        layer.emitterMode = kCAEmitterLayerOutline
        layer.emitterSize = CGSize(width: 25, height: 25)
        layer.emitterCells = [cell]
        layer.renderMode = kCAEmitterLayerOldestFirst
        layer.masksToBounds = false
        layer.birthRate = 0;
        
        return layer
    }()
}
