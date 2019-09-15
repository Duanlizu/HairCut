//
//  YGOrderListViewController.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGOrderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YGOrderListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *listTableview;
@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
