//
//  YGMyViewController.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGMyViewController.h"
#import "YGUserHeaderView.h"
#import "YGSetTableViewCell.h"
#import "YGMyOrderViewController.h"
#import "YGSetViewController.h"

@interface YGMyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) YGUserHeaderView *headView;
@property (nonatomic, strong) NSArray *titleArr;
@end

@implementation YGMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"我的";
    [self.view addSubview:self.myTableView];
    self.myTableView.tableHeaderView = self.headView;
    [CYNotificationCenter addObserver:self selector:@selector(refreshhead) name:@"refresh" object:nil];
}
- (void)refreshhead{
    NSString *likecount = [[NSUserDefaults standardUserDefaults]objectForKey:@"like"];
    self.headView.likenumber.text = likecount;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YGSetTableViewCell *cell = [YGSetTableViewCell cellWithTableview:tableView];
    cell.leftImg.image = CYImage(self.titleArr[indexPath.row]);
    cell.title.text = self.titleArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        YGMyOrderViewController *order= [[YGMyOrderViewController alloc]init];
        [self.navigationController pushViewController:order animated:YES];
    }else if (indexPath.row == 1) {
        [self cleanCache];
    }else{
        YGSetViewController *set= [[YGSetViewController alloc]init];
        [self.navigationController pushViewController:set animated:YES];
    }
}
#pragma mark - 清理缓存
- (void)cleanCache{
    
    [AlertUtil showConformAlert:@"提示" detail:@"确定删除缓存吗?" conformTitle:@"确定" conformHandler:^(NSInteger index) {
        CYShowHub;
        [[YYWebImageManager sharedManager].cache.diskCache removeAllObjectsWithBlock:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self calculateCache];
            });
        }];
    } cancelTitle:@"取消" cancelHandler:^(NSInteger index) {
    }];
}
#pragma mark 计算缓存
- (void)calculateCache{
    //设置文字
    NSInteger totalSize = [YYWebImageManager sharedManager].cache.diskCache.totalCost;
    CGFloat yyCaceSize = totalSize / 1048576.0;
    CGFloat totalCaceSize = yyCaceSize;
    if (totalCaceSize > 0) {
        
        NSString *string = [NSString stringWithFormat:@"剩余缓存%.2fM", totalCaceSize];
         CYShowTips(string);
    } else {
         CYShowTips(@"清理完成，无缓存");
    }
}
- (YGUserHeaderView *)headView{
    if (!_headView) {
        _headView = [[YGUserHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 255*CYScale)];
        NSString *likecount = [[NSUserDefaults standardUserDefaults]objectForKey:@"like"];
        _headView.likenumber.text = likecount;
    }
    return _headView;
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-NAVIGATION_BAR_HEIGHT-TAB_BAR_HEIGHT) style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}
- (NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"我的订单",@"清除缓存",@"设置"];
    }
    return _titleArr;
}
@end
