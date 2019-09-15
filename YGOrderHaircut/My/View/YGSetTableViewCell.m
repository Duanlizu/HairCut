//
//  YGSetTableViewCell.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGSetTableViewCell.h"

@implementation YGSetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)cellWithTableview:(UITableView *)tableview{
    static NSString *indentifine = @"normalcell";
    YGSetTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:indentifine];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"YGSetTableViewCell" owner:nil options:nil].lastObject;
    }
    tableview.tableFooterView = [UIView new];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
