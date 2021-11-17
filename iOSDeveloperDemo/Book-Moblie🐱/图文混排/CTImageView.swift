//
//  CTImageView.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/16.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
let picWidth = CGFloat(UIScreen.main.bounds.size.width)
let picHeight = CGFloat(300)

class CTImageView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        UIColor.brown.setFill()
        UIRectFill(rect)
        

            //设置占位符的尺寸
        var ctRunCallback = CTRunDelegateCallbacks(version: kCTRunDelegateVersion1, dealloc: {(refCon) -> Void in
            
        }, getAscent: {(refCon) -> CGFloat in
            return picHeight
        }, getDescent: {(refCon) -> CGFloat in
            return 0
        }) {(refCon) -> CGFloat in
            return picWidth
        }
        
        var picture = "textLayout"
        let ctRunDelegate = CTRunDelegateCreate(&ctRunCallback, &picture)
        let placeHolder = NSMutableAttributedString(string: " ")//空格
        placeHolder.addAttribute(NSAttributedStringKey(rawValue: kCTRunDelegateAttributeName as String),value:ctRunDelegate!, range: NSMakeRange(0, 1))
        placeHolder.addAttribute(NSAttributedStringKey(rawValue: "pictureName"), value: picture, range: NSMakeRange(0, 1))
        
        let article = "文本布局就是把字形排列在显示屏上的过程,大部分语言都是\n\n从左到右,从上到下排列,但是有时候可能需要从上往下排列,或者围绕图片周围排列.换行:在文本系统中，可以在单词或字形边界处指定换行符布局管理器沿着(基线)baseline排列视图,如上图"
        let attributedStr = NSMutableAttributedString(string: article)
        attributedStr.insert(placeHolder, at: 28)// 换行符之间处 /n 占位
        attributedStr.addAttribute(NSAttributedStringKey(rawValue: kCTUnderlineStyleAttributeName as String), value: NSNumber(value: 1), range: NSRange(location: 0, length: attributedStr.length))
        
        let framesetter = CTFramesetterCreateWithAttributedString(attributedStr)
        let path = UIBezierPath(rect: rect)
        let ctFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attributedStr.length), path.cgPath, nil)
        
        let crtContext = UIGraphicsGetCurrentContext()
        crtContext?.textMatrix = CGAffineTransform.identity
        crtContext?.scaleBy(x: 1.0, y: -1.0)
        crtContext?.translateBy(x: 0, y: self.bounds.size.height * -1)
        CTFrameDraw(ctFrame, crtContext!)
        
        
        let ctLines = CTFrameGetLines(ctFrame) as NSArray
        var originsOfLines = [CGPoint]()
        for _ in 0..<ctLines.count{
            originsOfLines.append(CGPoint.zero)
        }
        let range : CFRange = CFRangeMake(0, 0)
        CTFrameGetLineOrigins(ctFrame, range, &originsOfLines)
        
        for i in 0..<ctLines.count{
            let ctLineOrigin = originsOfLines[i]
            let ctRuns = CTLineGetGlyphRuns(ctLines[i] as! CTLine) as NSArray
            
            for ctRun in ctRuns{
                let ctAttributes = CTRunGetAttributes(ctRun as! CTRun) as NSDictionary
                let pictureName = ctAttributes.object(forKey: "pictureName")
                if pictureName != nil{
                    let offset = CTLineGetOffsetForStringIndex(ctLines[i] as! CTLine, CTRunGetStringRange(ctRun as! CTRun).location, nil)
                    
                    let picturePosX = ctLineOrigin.x + offset
                    print("offset------\(offset)-----picturePosX---\(ctLineOrigin.x )")
                    let pictureFrame = CGRect(x: picturePosX, y: ctLineOrigin.y, width: picWidth, height: picHeight)

                    let image = UIImage(named: pictureName as! String)
                    crtContext?.draw((image?.cgImage)!, in: pictureFrame)
                }
            }
        }
    }
}
