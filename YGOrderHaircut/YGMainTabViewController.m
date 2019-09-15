//
//  YGMainTabViewController.m
//  YouGu
//
//  Created by mc1 on 2019/6/17.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGMainTabViewController.h"


@interface YGMainTabViewController ()<UITabBarControllerDelegate>
@end

@implementation YGMainTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    NSArray <NSDictionary *>*data = @[
                                      @{@"image": @"预约-未点击", @"selectedImage":@"预约-点击",@"title": @"预约", @"clsName": @"YGOrderViewController"},
                                      @{@"image": @"发现-未点击", @"selectedImage":@"发现-点击",@"title": @"发现", @"clsName": @"YGFindViewController"},
                                      @{@"image": @"我的-未点击", @"selectedImage":@"我的-点击",@"title": @"我的", @"clsName": @"YGMyViewController"}];
    // 添加子控制器
    for (NSDictionary *dic in data) {
        Class c = NSClassFromString(dic[@"clsName"]);
        UIViewController *vc = [[c alloc]init];
        [self addChildViewControllerWithController:vc ImageName:dic[@"image"] sclectedImage:dic[@"selectedImage"] title:dic[@"title"]];
    }
    
}
// 添加子控制器
- (void)addChildViewControllerWithController:(UIViewController *)childController ImageName:(NSString *)image sclectedImage:(NSString *)selectedImage title:(NSString *)title{
    
    //设置导航栏控制器
    YGMainNavController *nav = [[YGMainNavController alloc]initWithRootViewController:childController];
    
    //设置tabbar自控制器
    nav.tabBarItem.title = title;
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attr[NSForegroundColorAttributeName] = [UIColor grayColor];
    [nav.tabBarItem setTitleTextAttributes:attr forState:UIControlStateNormal];
    
    NSMutableDictionary *attrSelected = [NSMutableDictionary dictionary];
    attrSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrSelected[NSForegroundColorAttributeName] = [UIColor cy_garyTextColor];
    [nav.tabBarItem setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
    nav.tabBarItem.image = [UIImage imageNamed:image];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    [self addChildViewController:nav];
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
}
@end
