//
//  YGComboViewController.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/8.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGComboViewController.h"

@interface YGComboViewController ()


@end

@implementation YGComboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.img.contentMode = UIViewContentModeScaleAspectFill;
    self.title = _model.title;
    self.img.image = CYImage(_model.title);
    self.price.text = [NSString stringWithFormat:@"%@",_model.count];
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
