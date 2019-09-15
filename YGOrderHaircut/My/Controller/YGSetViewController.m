//
//  YGSetViewController.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGSetViewController.h"
#import "YGLoginViewController.h"

@interface YGSetViewController ()

@end

@implementation YGSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
}
- (IBAction)exit:(id)sender {
    YGLoginViewController *login = [[YGLoginViewController alloc]init];
    YGMainNavController *navc  = [[YGMainNavController alloc]initWithRootViewController:login];
    login.title = @"登陆";
    [UIApplication sharedApplication].keyWindow.rootViewController = navc;
}


@end
