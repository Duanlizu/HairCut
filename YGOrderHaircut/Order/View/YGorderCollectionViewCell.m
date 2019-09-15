//
//  YGorderCollectionViewCell.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGorderCollectionViewCell.h"

@implementation YGorderCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    self.topImg.image = CYImage(dic[@"name"]);
    self.botoomLab.text = dic[@"name"];
}
@end
