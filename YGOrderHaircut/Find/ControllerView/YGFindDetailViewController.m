//
//  YGFindDetailViewController.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGFindDetailViewController.h"

@interface YGFindDetailViewController ()

@end

@implementation YGFindDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情页";
    self.topimg.contentMode = UIViewContentModeScaleAspectFill;
    self.topimg.clipsToBounds = YES;
    self.topimg.image = CYImage(_dic[@"image"]) ;
    self.headimg.image = CYImage(_dic[@"image"]) ;
    self.coment.text = _dic[@"title"];
    [self.zancout setTitle:_dic[@"count"]forState:UIControlStateNormal];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"11"]);
}
- (IBAction)zan:(UIButton *)sender {
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObjectsFromArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"find"]];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:self.dic] ;
    [self.zancout setTitle:[NSString stringWithFormat:@"%ld",[dic[@"count"] integerValue]+1] forState:UIControlStateNormal];
    [dic setObject:[NSString stringWithFormat:@"%ld",[dic[@"count"] integerValue]+1] forKey:@"count"];
    [arr replaceObjectAtIndex:_index withObject:dic];
    [[NSUserDefaults standardUserDefaults]setObject:arr forKey:@"find"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //喜欢数量
    NSString *likecount = [[NSUserDefaults standardUserDefaults]objectForKey:@"like"];
    likecount = [NSString stringWithFormat:@"%ld",[likecount integerValue]+1];
    [[NSUserDefaults standardUserDefaults]setObject:likecount forKey:@"like"];
    [CYNotificationCenter postNotificationName:@"refresh" object:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
