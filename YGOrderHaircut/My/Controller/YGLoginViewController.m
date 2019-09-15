//
//  YGLoginViewController.m
//  YouGu
//
//  Created by mc1 on 2019/6/18.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGLoginViewController.h"


@interface YGLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;//电话号码
@property (weak, nonatomic) IBOutlet UITextField *code;//验证码或密码

@end

@implementation YGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
}

//登录
- (IBAction)Login:(UIButton *)sender {
    
    if ([self.phoneNumber.text isEqualToString:@"19988887777"]&&[self.code.text isEqualToString:@"123456"]){
        YGMainTabViewController *vc = [[YGMainTabViewController alloc]init];
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    }else{
        CYShowTips(@"请您检查账号和密码是否正确");
    }

    
}


@end
