//
//  YGOrderModel.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGOrderDetaiModel : NSObject
@property (nonatomic, strong) NSArray *price;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *title;
@end

@class YGOrderDetaiModel;
@interface YGOrderModel : NSObject
@property (nonatomic, strong) NSArray <YGOrderDetaiModel *> *list;
@property (nonatomic, strong) NSString *name;

@end


