//
//  YGFindeCollectionViewCell.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGFindeCollectionViewCell.h"

@implementation YGFindeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.mainImg.contentMode = UIViewContentModeScaleAspectFill;
    self.headimg.contentMode = UIViewContentModeScaleAspectFill;
}
- (IBAction)clidk:(id)sender {
    if (self.clickBlock) {
        _clickBlock();
    }
}
- (void)setDic:(NSMutableDictionary *)dic{
    _dic = dic;
    self.mainImg.image = CYImage(dic[@"image"]);
    self.tips.text = dic[@"title"];
    [self.zanCount setTitle:dic[@"count"] forState:UIControlStateNormal];
    self.headimg.image = CYImage(dic[@"image"]);
    
}
@end
