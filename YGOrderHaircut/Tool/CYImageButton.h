//
//  CYImageButton.h
//  
//
//  Created by 魏博 on 2018/7/30.
//  Copyright © 2018年 魏博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYImageButtonModel : NSObject

@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *text;
+ (instancetype)modelWithTitle:(NSString *)title image:(UIImage *)image;

@end


typedef NS_ENUM(NSInteger, cyImageButtonPosition) {
    cyImageButtonPositionLeft = 0,    // 图片在左，文字在右，默认
    cyImageButtonPositionRight,       // 图片在右，文字在左
    cyImageButtonPositionTop,         // 图片在上，文字在下
    cyImageButtonPositionBottom,      // 图片在下，文字在上
};

@interface CYImageButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title imageName:(NSString *)imageName;

- (void)imagePosition:(cyImageButtonPosition)postion spacing:(CGFloat)spacing;
- (void)imagePosition:(cyImageButtonPosition)postion spacing:(CGFloat)spacing imageViewResize:(CGSize)size;

@end
