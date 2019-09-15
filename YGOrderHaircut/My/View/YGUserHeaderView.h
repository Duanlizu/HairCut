//
//  YGUserHeaderView.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGUserHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *likenumber;
@property (weak, nonatomic) IBOutlet UIImageView *backimg;

@end

NS_ASSUME_NONNULL_END
