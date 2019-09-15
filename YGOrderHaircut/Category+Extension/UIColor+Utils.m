//
//  UIColor+Utils.m
//  EGCXiaoNiCustomize
//
//  Created by caoway on 16/8/1.
//  Copyright © 2016年 com.egc. All rights reserved.
//

#import "UIColor+Utils.h"

@implementation UIColor (Utils)
+ (UIColor *)cy_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length   = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}


+ (UIColor *)cy_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((float) red / 255.0f) green:((float) green / 255.0f) blue:((float) blue / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)cy_colorWithHexString:(NSString *)color
{
    return [self cy_colorWithHexString:color alpha:1.0f];
}

+ (UIColor *)cy_navBgColor{
    return [self cy_colorWithRed:43 green:196 blue:148 alpha:1.0];
}

+ (UIColor *)cy_bodyBGColor {
    return [self cy_colorWithHexString:@"#f2f2f5"];
}

+ (UIColor *)cy_garyTextColor {
    return [self cy_colorWithHexString:@"#333333"];
}

+ (UIColor *)cy_redColor {
    return [self cy_colorWithHexString:@"#e40003"];
}

+ (UIColor *)cy_originColor {
    return [self cy_colorWithHexString:@"#ee7800"];
}
+ (UIColor *)cy_greenColor{
    return [self cy_colorWithHexString:@"#1CC424"];
}
+ (UIColor *)cy_pinkColor{
    return [self cy_colorWithHexString:@"#FF004D"];
}
@end
