//
//  YGFindDetailViewController.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGFindDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *topimg;
@property (nonatomic, strong) NSMutableDictionary *dic;
@property (weak, nonatomic) IBOutlet UIButton *zancout;
@property (weak, nonatomic) IBOutlet UIImageView *headimg;
@property (weak, nonatomic) IBOutlet UILabel *coment;
@property (nonatomic, assign) NSInteger index;
@end

NS_ASSUME_NONNULL_END
