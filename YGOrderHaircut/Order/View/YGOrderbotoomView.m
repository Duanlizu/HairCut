//
//  YGOrderbotoomView.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/9.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGOrderbotoomView.h"

@implementation YGOrderbotoomView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
- (void)initUI{

    _scrollview = [[UIScrollView alloc]init];
    _scrollview.backgroundColor = [UIColor cy_bodyBGColor];
    _scrollview.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollview];
    [_scrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.offset(0);
    }];
    NSArray *imagArr = @[@"烫染套餐",@"造型趋势",@"护理套餐"];
    NSArray *priceArr = @[@"￥399",@"￥299",@"￥199"];
    for (int i=0; i<imagArr.count; i++) {
        UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
        bt.frame = CGRectMake(15+(15+150*CYScale)*i, 0, 150*CYScale, kScreenHeight-370-TAB_BAR_HEIGHT);
        bt.backgroundColor = [UIColor whiteColor];
        bt.layer.cornerRadius = 5;
        bt.clipsToBounds = YES;
        bt.frame = CGRectMake(15+(15+150*CYScale)*i, 0, 150*CYScale, self.frame.size.height-2);
        bt.tag = i;
        [bt addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollview addSubview:bt];
        _scrollview.contentSize = CGSizeMake(15+(15+150*CYScale)*3, 0);
        UIImageView *topimg = [[UIImageView alloc]initWithImage:CYImage(imagArr[i])];
        topimg.frame = CGRectMake(0, 0, 150*CYScale, self.frame.size.height-35);
        [bt addSubview:topimg];
        
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(8, self.frame.size.height-22, 80, 16)];
        name.font = CYFont(15);
        name.text = imagArr[i];
        [bt addSubview:name];
        
        UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(150*CYScale-80,self.frame.size.height-22, 72, 16)];
        price.font = CYFont(15);
        price.textAlignment = NSTextAlignmentRight;
        price.textColor = [UIColor redColor];
        price.text = priceArr[i];
        [bt addSubview:price];
        YGFindModel *model = [[YGFindModel alloc]init];
        model.title = imagArr[i];
        model.count = priceArr[i];
        [self.comenArr addObject:model];
    }
      
}
- (NSMutableArray *)comenArr{
    if (!_comenArr) {
        _comenArr = [NSMutableArray array];
    }
    return _comenArr;
}
- (void)click:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pushWithModel:)]) {
        [self.delegate pushWithModel:self.comenArr[sender.tag]];
    }
}
@end
