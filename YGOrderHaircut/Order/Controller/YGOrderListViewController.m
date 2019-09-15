//
//  YGOrderListViewController.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGOrderListViewController.h"
#import "YGListTableViewCell.h"

@interface YGOrderListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *backBt;

@end

@implementation YGOrderListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.backBt setTitle:[NSString stringWithFormat:@"%@预约",_name] forState:UIControlStateNormal];
    if ([_name isEqualToString:@"面部护理"]) {
        [self.backBt setTitle:@"面部预约" forState:UIControlStateNormal];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YGListTableViewCell *cell = [YGListTableViewCell cellWithTableview:tableView];
    cell.dic = self.datasource[indexPath.row];
    cell.orderBlock = ^{
        CYShowHubdissmiss;
        [self performSelector:@selector(deley) withObject:nil afterDelay:1.5];
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObjectsFromArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"data2"]];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:self.datasource[indexPath.row]];
        [dic setObject:[self getCurrentTimes] forKey:@"time"];
        [arr addObject:dic];
        [[NSUserDefaults standardUserDefaults]setObject:arr forKey:@"data2"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    };
    return cell;
}
-(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy:MM:dd HH:mm"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}
- (void)deley{
    [AlertUtil showMessageAlert:@"预约成功" detail:@"店家稍后会与您联系" handler:^(NSInteger index) {
        
    }];
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
@end
