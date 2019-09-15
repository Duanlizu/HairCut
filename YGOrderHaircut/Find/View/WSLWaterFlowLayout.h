//
//  YGUserHeaderView.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    WSLWaterFlowVerticalEqualWidth = 0,
    WSLWaterFlowHorizontalEqualHeight = 1,
    WSLWaterFlowVerticalEqualHeight = 2,
    WSLWaterFlowHorizontalGrid = 3,
    WSLLineWaterFlow = 4
} WSLWaterFlowLayoutStyle; //样式

@class WSLWaterFlowLayout;

@protocol WSLWaterFlowLayoutDelegate <NSObject>


- (CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/** 头视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForHeaderViewInSection:(NSInteger)section;
/** 脚视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForFooterViewInSection:(NSInteger)section;

@optional //以下都有默认值
/** 列数*/
-(CGFloat)columnCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
/** 行数*/
-(CGFloat)rowCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;

/** 列间距*/
-(CGFloat)columnMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
/** 行间距*/
-(CGFloat)rowMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;
/** 边缘之间的间距*/
-(UIEdgeInsets)edgeInsetInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout;

@end

@interface WSLWaterFlowLayout : UICollectionViewLayout

/** delegate*/
@property (nonatomic, weak) id<WSLWaterFlowLayoutDelegate> delegate;
/** 瀑布流样式*/
@property (nonatomic, assign) WSLWaterFlowLayoutStyle  flowLayoutStyle;

@end
