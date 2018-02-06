//
//  GYVideoLayout.h
//  Menfolk
//
//  Created by zhugy on 2018/2/6.
//  Copyright © 2018年 zhugy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GYVideoLayout;

@protocol GYVideoLayoutDelegate <NSObject>

@required
- (CGFloat)WaterFlowLayout:(GYVideoLayout *)WaterFlowLayout heightForRowAtIndexPath:(NSInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInWaterflowLayout:(GYVideoLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(GYVideoLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(GYVideoLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(GYVideoLayout *)waterflowLayout;

@end
@interface GYVideoLayout : UICollectionViewLayout
@property (nonatomic ,weak) id<GYVideoLayoutDelegate> delegate;
@end
