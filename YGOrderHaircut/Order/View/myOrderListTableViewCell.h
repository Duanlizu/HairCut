//
//  myOrderListTableViewCell.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/9.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface myOrderListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (nonatomic, strong) NSMutableDictionary *dic;
@property (weak, nonatomic) IBOutlet UIView *botoom;
+ (instancetype)cellWithTableview:(UITableView *)tableview;
@end

NS_ASSUME_NONNULL_END
