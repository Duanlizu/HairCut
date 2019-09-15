//
//  YGorderCollectionViewCell.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGOrderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGorderCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *topImg;
@property (weak, nonatomic) IBOutlet UILabel *botoomLab;
@property (nonatomic, strong) NSDictionary *dic;


@end

NS_ASSUME_NONNULL_END
