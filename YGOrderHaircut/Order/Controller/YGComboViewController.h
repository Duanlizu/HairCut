//
//  YGComboViewController.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGComboViewController : UIViewController
@property (nonatomic, strong) YGFindModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *price;

@end

NS_ASSUME_NONNULL_END
