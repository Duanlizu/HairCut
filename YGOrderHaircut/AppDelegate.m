//
//  AppDelegate.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import "AppDelegate.h"
#import "YGLoginViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) NSMutableArray *datasource;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    YGLoginViewController *login = [[YGLoginViewController alloc]init];
    YGMainNavController *navc  = [[YGMainNavController alloc]initWithRootViewController:login];
    login.title = @"登陆";
    self.window.rootViewController = navc;
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"] ) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        [self addData];
    }
    
    return YES;
}
- (void)addData{
    
    NSArray *imagarr = @[@"发现-素材-1",@"发现-素材-2",@"发现-素材-3",@"发现-素材-4"];
    NSArray *titlearr = @[@"村口李师傅家烫的很满意",@"周末试了烫染套餐，不错呢",@"今年的流行色青木灰",@"一生挚爱抽烟喝酒烫头"];
    for (int i=0; i<imagarr.count; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:imagarr[i] forKey:@"image"];
        [dic setObject:titlearr[i] forKey:@"title"];
        [dic setObject:[NSString stringWithFormat:@"%d",arc4random_uniform(80)] forKey:@"count"];
        [dic setObject:[NSString stringWithFormat:@"%d",200+arc4random_uniform(100)] forKey:@"height"];
        [self.datasource addObject:dic];
    }
    [[NSUserDefaults standardUserDefaults]setObject:self.datasource forKey:@"find"];
    [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"like"];
     [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@""];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
- (NSMutableArray *)datasource{
    if(!_datasource){
        _datasource = [NSMutableArray array];
    }
    return _datasource;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
