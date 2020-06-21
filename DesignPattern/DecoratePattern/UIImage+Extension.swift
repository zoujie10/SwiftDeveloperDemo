//
//  UIImage+Extension.swift
//  iOSDeveloperDemo
//
//  Created by 邹杰 on 5/14/19.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func roundImage(byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadi: CGFloat) -> UIImage? {
        return roundImage(byRoundingCorners: byRoundingCorners, cornerRadii: CGSize(width: cornerRadi, height: cornerRadi))
    }
    
    public func roundImage(byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGSize) -> UIImage? {
        
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        guard context != nil else {
            return nil
        }
        context?.setShouldAntialias(true)
        let bezierPath = UIBezierPath(roundedRect: imageRect,
                                      byRoundingCorners: byRoundingCorners,
                                      cornerRadii: cornerRadii)
        bezierPath.close()
        bezierPath.addClip()
        self.draw(in: imageRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    
}
// MARK: 图片缩放
extension UIImage {
    
    public func scaleTo(size targetSize: CGSize) -> UIImage? {
        let srcSize = self.size
        if __CGSizeEqualToSize(srcSize, targetSize) {
            return self
        }
        
        let scaleRatio = targetSize.width / srcSize.width
        var dstSize = CGSize(width: targetSize.width, height: targetSize.height)
        let orientation = self.imageOrientation
        var transform = CGAffineTransform.identity
        switch orientation {
        case .up:
            transform = CGAffineTransform.identity
        case .upMirrored:
            transform = CGAffineTransform(translationX: srcSize.width, y: 0.0)
            transform = transform.scaledBy(x: -1.0, y: 1.0)
        case .down:
            transform = CGAffineTransform(translationX: srcSize.width, y: srcSize.height)
            transform = transform.scaledBy(x: 1.0, y: CGFloat(Double.pi/2))
        case .downMirrored:
            transform = CGAffineTransform(translationX: 0.0, y: srcSize.height)
            transform = transform.scaledBy(x: 1.0, y: -1.0)
        case .leftMirrored:
            dstSize = CGSize(width: dstSize.height, height: dstSize.width)
            transform = CGAffineTransform(translationX: srcSize.height, y: srcSize.width)
            transform = transform.scaledBy(x: -1.0, y: 1.0)
            transform = transform.rotated(by: CGFloat(3.0) * CGFloat(Double.pi/2))
        case .left:
            dstSize = CGSize(width: dstSize.height, height: dstSize.width)
            transform = CGAffineTransform(translationX: 0.0, y: srcSize.width)
            transform = transform.rotated(by: CGFloat(3.0) * CGFloat(Double.pi/2))
        case .rightMirrored:
            dstSize = CGSize(width: dstSize.height, height: dstSize.width)
            transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            transform = transform.rotated(by:  CGFloat(Double.pi/2))
        default:
            dstSize = CGSize(width: dstSize.height, height: dstSize.width)
            transform = CGAffineTransform(translationX: srcSize.height, y: 0.0)
            transform = transform.rotated(by:  CGFloat(Double.pi/2))
        }
        
        UIGraphicsBeginImageContextWithOptions(dstSize, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        guard context != nil else {
            return nil
        }
        context?.setShouldAntialias(true)
        if orientation == UIImage.Orientation.right || orientation == UIImage.Orientation.left {
            context?.scaleBy(x: -scaleRatio, y: scaleRatio)
            context?.translateBy(x: -srcSize.height, y: 0)
        }
        else {
            context?.scaleBy(x: scaleRatio, y: -scaleRatio)
            context?.translateBy(x: 0, y: -srcSize.height)
        }
        context?.concatenate(transform)
        guard let cgImage = self.cgImage else {
            return nil
        }
        context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: srcSize.width, height: srcSize.height))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public func scaleTo(fitSize targetSize: CGSize, scaleIfSmaller: Bool = false) -> UIImage? {
        let srcSize = self.size
        if __CGSizeEqualToSize(srcSize, targetSize) {
            return self
        }
        
        let orientation = self.imageOrientation
        var dstSize = targetSize
        switch orientation {
        case .left, .right, .leftMirrored, .rightMirrored:
            dstSize = CGSize(width: dstSize.height, height: dstSize.width)
        default:
            break
        }
        if !scaleIfSmaller && (srcSize.width < dstSize.width) && (srcSize.height < dstSize.height) {
            dstSize = srcSize
        }
        else {
            let wRatio = dstSize.width / srcSize.width
            let hRatio = dstSize.height / srcSize.height
            dstSize = wRatio < hRatio ?
                CGSize(width: dstSize.width, height: srcSize.height * wRatio) :
                CGSize(width: srcSize.width * wRatio, height: dstSize.height)
        }
        return self.scaleTo(size: dstSize)
    }
}
extension UIImage{
    // 截取部分图片
    func imageAtRect(rect: CGRect) -> UIImage{
        var rect = rect
        rect.origin.x *= self.scale
        rect.origin.y *= self.scale
        rect.size.width *= self.scale
        rect.size.height *= self.scale
        let imageRef = self.cgImage!.cropping(to: rect)
        let image = UIImage(cgImage: imageRef!, scale: self.scale, orientation: self.imageOrientation)
        return image
    }
}
