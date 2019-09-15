//
//  YGMainNavController.m
//  YouGu
//
//  Created by mc1 on 2019/6/17.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGMainNavController.h"

@interface YGMainNavController ()<UIGestureRecognizerDelegate>

@end

@implementation YGMainNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}
//导航栏基础设置
+ (void)initialize{
    [[UINavigationBar appearance]setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName : [UIFont boldSystemFontOfSize:17] }];
    [UINavigationBar appearance].tintColor = [UIColor blackColor];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor cy_bodyBGColor]] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance]setShadowImage:[[UIImage alloc]init]];
    [[UINavigationBar appearance] setTranslucent:NO];
}
//侧滑返回
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count <= 1 ) {
        return NO;
    }
    return YES;
}
//count大于1添加返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:CYImage(@"fanhui_gray") style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        
    }
    [super pushViewController:viewController animated:animated];
}

// 返回
- (void)back {
    [self popViewControllerAnimated:YES];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
@end
