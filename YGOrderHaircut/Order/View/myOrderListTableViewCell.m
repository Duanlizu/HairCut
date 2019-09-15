//
//  myOrderListTableViewCell.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/9.
//  Copyright © 2019 kou. All rights reserved.
//

#import "myOrderListTableViewCell.h"

@implementation myOrderListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableview:(UITableView *)tableview{
    static NSString *indentifine = @"lcell";
    myOrderListTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:indentifine];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"myOrderListTableViewCell" owner:nil options:nil].lastObject;
    }
    tableview.tableFooterView = [UIView new];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}
- (void)setDic:(NSMutableDictionary *)dic{
    _dic = dic;
    _botoom.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    // 阴影偏移，默认(0, -3)
    _botoom.layer.shadowOffset = CGSizeMake(0,5);
    // 阴影透明度，默认0
    _botoom.layer.shadowOpacity = 0.5;
    // 阴影半径，默认3
    _botoom.layer.shadowRadius = 5;
    self.title.text = dic[@"title"];
    self.subtitle.text = dic[@"subtitle"];
    self.price.text = dic[@"price"];
    self.time.text = [NSString stringWithFormat:@"预约时间:%@",dic[@"time"]];
}
@end
