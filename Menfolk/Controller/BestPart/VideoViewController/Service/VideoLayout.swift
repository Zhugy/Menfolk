//
//  VideoLayout.swift
//  Menfolk
//
//  Created by zhugy on 2018/2/6.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit

protocol VideoLayoutDelegate: class {
    func videoLayoutHeight(layout: VideoLayout, at indexPathItem: Int , itemWidht: CGFloat) -> CGFloat
}

class VideoLayout: UICollectionViewLayout {
 
    /*
     //c存放所有cell的布局属性
     @property (nonatomic, strong) NSMutableArray *attrsArray;
     //存放所有列的当前高度
     @property (nonatomic, strong) NSMutableArray *columnHeights;
     /** 内容的高度 */
     @property (nonatomic, assign) CGFloat contentHeight;
     
     作者：是我始终拒绝成长吗
     链接：https://www.jianshu.com/p/040c824736cd
     來源：简书
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    var attrsArray: [UICollectionViewLayoutAttributes] = []
    var columnHeights: [CGFloat] = []
    var contentHeight: CGFloat = 0.0
    
    weak var delegate: VideoLayoutDelegate?
    
    override func prepare() {
        super.prepare()
        
        contentHeight = 0.0
        columnHeights.removeAll()
        for _ in 0 ... 1 {
            columnHeights.append(10)
        }
        
        attrsArray.removeAll()
        let count = collectionView?.numberOfItems(inSection: 0) ?? 0
        for i in 0 ... count {
            let indexPath = IndexPath.init(item: i, section: 0)
            if let attriButes: UICollectionViewLayoutAttributes = layoutAttributesForItem(at: indexPath) {
                attrsArray.append(attriButes)
            }
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrsArray
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes: UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let collectionViewW: CGFloat = collectionView?.frame.size.width ?? 0
        let w = (collectionViewW - 30 )/2
        let h = delegate?.videoLayoutHeight(layout: self, at: indexPath.item, itemWidht: w)
        var minColumnHeight = columnHeights[0]
        var destColumn: Int = 0
        for i in 0 ... 1 {
            var columnHeight = columnHeights[i]
            if minColumnHeight > columnHeight {
                minColumnHeight = columnHeight;
                destColumn = i;
            }
        }
         var x = 0
        if destColumn != 0 {
            x = Int(w - 10)
        }
        
        return nil
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}
