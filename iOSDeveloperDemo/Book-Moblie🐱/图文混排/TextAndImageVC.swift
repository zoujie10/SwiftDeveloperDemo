//
//  TextAndImageVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/10/16.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import CoreText

class TextAndImageVC: UIViewController {
    let str = " # CocoaPods\n## 安装\n1.检查Ruby版本\ngem --versionplatform:ios,'9.0'  \nuse_frameworks \ntarget 'iOSDeveloperDemo' do \n platform :ios, '10.0' \n   pod 'SnapKit' \n   pod 'Alamofire' \n pod 'Charts' \n pod 'SwiftyJSON'\n #    pod 'RealmSwift' \n   use_frameworks! \nend"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "图文混编"
        
        //1.CoreText
        useCoreText()
       
        //2.TextKit
        madeTextView()
  
    }
        //MARK: CoreText
    func useCoreText(){
        //1.文字排版基本概念
        /**
         1).字形和字符(Glyphs and Characters):字符是使用语言的最小单位，例如英语字母，阿拉伯数字。字形来展示字符，例如粗体，斜体等
         2).字型与字体(Typefaces and Fonts):字型是一组具有相似性的字体形状，字体是一组具有相同字型Typefaces的字型Glyphs。
         3).文字的布局:文本布局就是把字形排列在显示屏上的过程,大部分语言都是从左到右,从上到下排列,但是有时候可能需要从上往下排列,或者围绕图片周围排列.
         换行: 在文本系统中，可以在单词或字形边界处指定换行符布局管理器沿着(基线)baseline排列视图.
         */
        
        //2.设备所有字体
//        printALLFont()
        //3.富文本创建
        studyNSAttributedStringMethod()
        //4.图文混排实现
        //CoreText and Core Graphics
        textAndPicMethod()
    }
    
    func printALLFont(){
        print(UIFont.familyNames.count)
        for font in UIFont.familyNames{
            print("\n[\(font)]")
            for speFont in UIFont.fontNames(forFamilyName: font){
                print("\t\(speFont)")
            }
        }
    }
    
    func studyNSAttributedStringMethod(){
        view.addSubview(self.attStrLabel)
        self.attStrLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp_top).offset(100)
            make.left.right.equalTo(view)
            make.height.equalTo(50)
        }
        let string = NSMutableAttributedString(string: "Interactive tutorials for Xcode")
       
        let font = CTFontCreateWithName(("CourierNerPS-BoldMT" as CFString?)!, 22, nil)
        string.addAttributes([NSAttributedString.Key.font:font], range: NSRange(location: 0, length: 11))
        
        let number = 3
        string.addAttributes([NSAttributedString.Key.strokeWidth:NSNumber(value: number)], range:NSRange(location: 12, length: 9))

        string.addAttributes([NSAttributedString.Key.font:font], range:NSRange(location: 22, length: 3))
        
        string.addAttributes([NSAttributedString.Key.underlineStyle:NSNumber(value: NSUnderlineStyle.styleSingle.rawValue)], range:NSRange(location: 26, length: 5))
        self.attStrLabel.attributedText = string
    }
    
    func textAndPicMethod(){
        view.addSubview(self.textAndPic)
        self.textAndPic.snp.makeConstraints { make in
            make.top.equalTo(self.attStrLabel.snp_bottom)
            make.left.right.equalTo(self.view)
            make.height.equalTo(450)
        }
    }
    
    lazy var textAndPic : CTImageView = {
        let textAndPic = CTImageView()
        return textAndPic
    }()
    
    //MARK: TextKit
    func useTextKit(){
        //1.文字分栏
        
        //2.图文混排效果
    }

    
    func madeTextView(){
    
    }
    
    lazy var attStrLabel : UILabel = {
        let attStrLabel = UILabel()
        attStrLabel.backgroundColor = .white
        attStrLabel.textAlignment = .center
        return attStrLabel
    }()
}
