//
//  YGOrderModel.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGOrderModel.h"

@implementation YGOrderModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list" : [YGOrderDetaiModel class]};
}
@end
@implementation YGOrderDetaiModel

@end
