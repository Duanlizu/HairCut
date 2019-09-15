//
//  YGOrderbotoomView.h
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/9.
//  Copyright © 2019 kou. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YGOrderDelegate<NSObject>
- (void)pushWithModel:(YGFindModel *)model;
@end
NS_ASSUME_NONNULL_BEGIN

@interface YGOrderbotoomView : UIView
@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) NSMutableArray *comenArr;
@property (nonatomic, strong) id<YGOrderDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
