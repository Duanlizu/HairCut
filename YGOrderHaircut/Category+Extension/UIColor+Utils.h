//
//  UIColor+Utils.h
//  EGCXiaoNiCustomize
//
//  Created by caoway on 16/8/1.
//  Copyright © 2016年 com.egc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utils)
+ (UIColor *)cy_colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)cy_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

// 导航栏背景颜色
+ (UIColor *)cy_navBgColor;

// 页面主体颜色
+ (UIColor *)cy_bodyBGColor;

// 主体灰色文字
+ (UIColor *)cy_garyTextColor;

// 自定义颜色 red：红色色值  green：绿色色值  blue：蓝色色值  alpha：透明度
+ (UIColor *)cy_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

// 红色
+ (UIColor *)cy_redColor;

//橘黄色
+ (UIColor *)cy_originColor;


+ (UIColor *)cy_greenColor;

//粉色
+ (UIColor *)cy_pinkColor;
@end
