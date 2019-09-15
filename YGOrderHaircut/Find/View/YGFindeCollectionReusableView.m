//
//  YGFindeCollectionReusableView.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGFindeCollectionReusableView.h"

@implementation YGFindeCollectionReusableView
- (id)initWithFrame:(CGRect)frame{
    self  = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}
- (void)initUI{
    UILabel *title = [[UILabel alloc]init];
    title.text = @"发现";
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
}
@end
