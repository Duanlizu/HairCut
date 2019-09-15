//
//  YGUserHeaderView.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGUserHeaderView.h"

@implementation YGUserHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initui];
        self.backgroundColor = [UIColor cy_bodyBGColor];
    }
    
    return self;
}
- (void)initui{
    
    UIImageView *backimg = [[UIImageView alloc]init];
    backimg.image = CYImage(@"头像bg");
    [self addSubview:backimg];
    [backimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
        make.height.equalTo(@(230*CYScale));
    }];
    
    UIImageView *headimg = [[UIImageView alloc]init];
    self.headImg = headimg;
    headimg.image = CYImage(@"头像");
    [backimg addSubview:headimg];
    [headimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(35*CYScale));
        make.size.mas_equalTo(CGSizeMake(70*CYScale, 70*CYScale));
        make.centerX.mas_equalTo(backimg.mas_centerX);
    }];
    
    UILabel *nickname = [[UILabel alloc]init];
    nickname.text = @"jack";
    nickname.textColor = [UIColor whiteColor];
    self.name = nickname;
    nickname.font = CYFont(17*CYScale);
    [backimg addSubview:nickname];
    [nickname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(headimg.mas_bottom).offset(10*CYScale);
        make.centerX.mas_equalTo(headimg.mas_centerX);
    }];
    
    UILabel *likenumber = [[UILabel alloc]init];
    likenumber.text = @"0";
    likenumber.textColor = [UIColor whiteColor];
    self.likenumber = likenumber;
    likenumber.font = CYFont(15*CYScale);
    [backimg addSubview:likenumber];
    [likenumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(backimg.mas_bottom).offset(-10*CYScale);
        make.centerX.mas_equalTo(headimg.mas_centerX);
    }];
    
    UILabel *like = [[UILabel alloc]init];
    like.text = @"喜欢";
    like.textColor = [UIColor whiteColor];
    like.font = CYFont(15*CYScale);
    [backimg addSubview:like];
    [like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(likenumber.mas_top).offset(-10*CYScale);
        make.centerX.mas_equalTo(headimg.mas_centerX);
    }];
    
   
}
@end
