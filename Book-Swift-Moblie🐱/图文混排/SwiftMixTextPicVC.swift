//
//  SwiftMixTextPicVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/18.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftMixTextPicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = "TextKit 图文混编"
        makeUI()
        // Do any additional setup after loading the view.
    }
    
    func makeUI(){
        let textView = UITextView(frame: CGRect(x: 0, y: 140, width: view.frame.size.width, height: 500))
        textView.backgroundColor = .brown
        textView.isEditable = false
        view.addSubview(textView)
        textView.isScrollEnabled = false
        let textStorage = textView.textStorage
        let path = Bundle.main.url(forResource: "GitText", withExtension: "txt")
        do{
            let string = try String(contentsOf: path!)
            textStorage.replaceCharacters(in: NSRange(location: 0, length: 0), with: string)
        }
        catch{
            print("读取文件错误!")
        }
        
        let image = UIImage(named: "fruiticons_buttons_grape")
        let imageView = UIImageView(image: image)
        let rect = CGRect(x: 0, y: 10, width: 200, height: 280)
        imageView.frame = rect
        
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
//        imageView.layer.borderWidth = 5
        textView.addSubview(imageView)
//        imageView.isHidden = true
        var frame = textView.convert(imageView.bounds, to: imageView)
        frame.origin.x = textView.textContainerInset.left
        frame.origin.y = textView.textContainerInset.top
        
        let path2 = UIBezierPath(ovalIn: frame)
        textView.textContainer.exclusionPaths = [path2]
    }



}
