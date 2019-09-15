//
//  YGListTableViewCell.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGOrderModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^orderComboBlock)(void);

@interface YGListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIView *botoomview;
@property (nonatomic, copy) orderComboBlock orderBlock;
+ (instancetype)cellWithTableview:(UITableView *)tableview;
@property (nonatomic, strong) NSDictionary *dic;
@end

NS_ASSUME_NONNULL_END
