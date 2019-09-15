//
//  YGListTableViewCell.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGListTableViewCell.h"

@implementation YGListTableViewCell

+ (instancetype)cellWithTableview:(UITableView *)tableview{
    static NSString *indentifine = @"listcell";
    YGListTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:indentifine];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"YGListTableViewCell" owner:nil options:nil].lastObject;
    }
    tableview.tableFooterView = [UIView new];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}
- (IBAction)order:(UIButton *)sender {
    if (_orderBlock) {
        _orderBlock();
    }
}

- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    _botoomview.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    // 阴影偏移，默认(0, -3)
    _botoomview.layer.shadowOffset = CGSizeMake(0,5);
    // 阴影透明度，默认0
    _botoomview.layer.shadowOpacity = 0.5;
    // 阴影半径，默认3
    _botoomview.layer.shadowRadius = 5;
    self.title.text = dic[@"title"];
    self.subtitle.text = dic[@"subtitle"];
    self.price.text = dic[@"price"];
}
@end
