//
//  YGFindeCollectionViewCell.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^tapClickBlock)(void);

@interface YGFindeCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainImg;
@property (weak, nonatomic) IBOutlet UIImageView *headimg;
@property (weak, nonatomic) IBOutlet UILabel *tips;
@property (weak, nonatomic) IBOutlet UIButton *zanCount;
@property (nonatomic, copy) tapClickBlock clickBlock;
@property (nonatomic, strong) NSMutableDictionary *dic;

@end

NS_ASSUME_NONNULL_END
