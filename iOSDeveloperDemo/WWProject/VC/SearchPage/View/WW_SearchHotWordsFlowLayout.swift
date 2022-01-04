//
//  WW_SearchHotWordsFlowLayout.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2022/1/4.
//  Copyright © 2022 Zoujie. All rights reserved.
//

import UIKit
enum AlignType{
    case AlignWithLeft
    case AlignWithCenter
    case AlignWithRight
}

class WW_SearchHotWordsFlowLayout: UICollectionViewFlowLayout {
    var betweenOfCell : CGFloat = 5
    var sumCellWidth : CGFloat = 0 //居中对齐时，需要知道这行所有cell的宽度综合
    var cellType : AlignType
    
    
    override init() {
        self.cellType = .AlignWithLeft
        super.init()
    }
    convenience init(with cellType : AlignType){
        self.init()
        self.cellType = cellType
        
    }
    convenience init(with cellType : AlignType,betweenOfCell : CGFloat){
        self.init()
        self.cellType = cellType
        self.betweenOfCell = betweenOfCell
        self.minimumInteritemSpacing = betweenOfCell
        self.minimumLineSpacing = 5
        self.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes_t : [UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: rect)! as [UICollectionViewLayoutAttributes]
        let layoutAttributes : [UICollectionViewLayoutAttributes] = NSArray.init(array: layoutAttributes_t , copyItems: true) as! [UICollectionViewLayoutAttributes]
        let layoutAttributesTemp : NSMutableArray = NSMutableArray()

        for index in 0..<layoutAttributes.count {
            let currentAttr : UICollectionViewLayoutAttributes = layoutAttributes[index]
            var previousAttr : UICollectionViewLayoutAttributes?
            var nextAttr : UICollectionViewLayoutAttributes?
            
            if index != 0{
                previousAttr =  layoutAttributes[index-1]
            }
            if (index + 1) == layoutAttributes.count{
                nextAttr = layoutAttributes.last!
            }
            layoutAttributesTemp.add(currentAttr)
            self.sumCellWidth += currentAttr.frame.size.width
            
            var previousY : CGFloat?
            if (previousAttr != nil){
                previousY = previousAttr!.frame.maxY
            }
            let currentY = currentAttr.frame.maxY
            var nextY : CGFloat?
            if nextAttr != nil{
                nextY = nextAttr?.frame.maxY
            }
            
            if currentY != previousY && currentY != nextY{
                if (currentAttr.representedElementKind == UICollectionElementKindSectionHeader){
                    layoutAttributesTemp.removeAllObjects()
                    self.sumCellWidth = 0
                }else if (currentAttr.representedElementKind == UICollectionElementKindSectionFooter){
                    layoutAttributesTemp.removeAllObjects()
                    self.sumCellWidth = 0
                }else{
                    
                }
            }else if currentY != nextY{
                
            }
        }
        return layoutAttributes
    }
    
    func setCellFrameWith(mut layoutAttributes : inout [UICollectionViewLayoutAttributes]){
        var nowWidth : CGFloat = 0
        
        switch self.cellType {
            case .AlignWithLeft:
                nowWidth = self.sectionInset.left
                for attributes : UICollectionViewLayoutAttributes in layoutAttributes{
                    var nowFrame : CGRect = attributes.frame
                    nowFrame.origin.x = nowWidth
                    nowWidth += nowFrame.size.width + self.betweenOfCell
                }
                self.sumCellWidth = 0.0
                layoutAttributes.removeAll()
            case .AlignWithCenter:
                nowWidth = CGFloat(((self.collectionView?.frame.size.width)! - self.sumCellWidth - (CGFloat((layoutAttributes.count - 1)) * self.betweenOfCell)) / 2)
                for attributes : UICollectionViewLayoutAttributes in layoutAttributes{
                    var nowFrame : CGRect = attributes.frame
                    nowFrame.origin.x = nowWidth
                    nowWidth += nowFrame.size.width + self.betweenOfCell
                }
                self.sumCellWidth = 0.0
                layoutAttributes.removeAll()
            case .AlignWithRight:
                nowWidth = (self.collectionView?.frame.size.width)! - self.sectionInset.right
                for index in (layoutAttributes.count - 1)...0{
                    let attributes : UICollectionViewLayoutAttributes = layoutAttributes[index]
                    var nowFrame : CGRect = attributes.frame
                    nowFrame.origin.x = nowWidth - nowFrame.size.width
                    attributes.frame = nowFrame
                    nowWidth = nowWidth - nowFrame.size.width - self.betweenOfCell
                }
                
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
