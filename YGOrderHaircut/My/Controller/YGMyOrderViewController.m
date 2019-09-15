//
//  YGMyOrderViewController.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGMyOrderViewController.h"
#import "myOrderListTableViewCell.h"

@interface YGMyOrderViewController ()
@property (nonatomic, strong) NSMutableArray *datasource;
@property (weak, nonatomic) IBOutlet UITableView *listTab;
@end

@implementation YGMyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"我的订单";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myOrderListTableViewCell *cell = [myOrderListTableViewCell cellWithTableview:tableView];
    cell.dic = self.datasource[indexPath.row];
    return cell;
}
- (NSMutableArray *)datasource{
    if (!_datasource) {
        _datasource = [NSMutableArray array];
        [_datasource addObjectsFromArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"data2"]];
    }
    return _datasource;
}

@end
