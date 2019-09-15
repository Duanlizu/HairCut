//
// Created by 魏博 on 15/09/2017.
// Copyright (c) 2017 魏博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMPopupView.h"
#import "MMAlertView.h"
#import "FSActionSheet.h"
@interface AlertUtil : NSObject

+ (void) showFSActionSheetWithTitle:(NSString *)title delegate:(id<FSActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancleTitle highlightedButtonTitle:(NSString *)highlightedButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles selectedHandler:(FSActionSheetHandler)selectedHandler;

/**
 显示仅有一个确定按钮的提示窗口

 @param title 提示的标题
 @param detail 提示的内容
 */
+ (void)showMessageAlert:(NSString *)title detail:(NSString *)detail;

/**
 显示仅有一个确定按钮的提示窗口

 @param title 窗口标题
 @param detail 内容文字
 @param handler 当点击确定按钮时执行
 */
+ (void)showMessageAlert:(NSString *)title detail:(NSString *)detail handler:(MMPopupItemHandler)handler;

/**
 * 显示确认提示窗口
 * @param title 窗口标题
 * @param detail 内容文字
 * @param conformTitle 确认按钮标题
 * @param conformHandler 确认按钮执行
 * @param cancelTitle 取消按钮标题
 * @param cancelHandler 取消按钮标题
 */
+ (void)showConformAlert:(NSString *)title detail:(NSString *)detail conformTitle:(NSString *)conformTitle conformHandler:(MMPopupItemHandler)conformHandler cancelTitle:(NSString *)cancelTitle cancelHandler:(MMPopupItemHandler)cancelHandler;

/**
 显示包含一个执行内容的ActionSheet

 @param title 标题
 @param buttonTitle 按钮标题
 @param handler 当点击按钮时执行
 */
+ (void)showDestructiveActionSheet:(NSString *)title buttonTitle:(NSString *)buttonTitle handler:(MMPopupItemHandler)handler;

/**
 * 显示含有两个操作内容的ActionSheet
 * @param title 标题
 * @param button1Title 按钮1标题
 * @param handler1 按钮1执行
 * @param button2Title 按钮2标题
 * @param handler2 按钮2执行
 */
+ (void)showActionSheet:(NSString *)title button1:(NSString *)button1Title handler1:(MMPopupItemHandler)handler1 button2:(NSString *)button2Title handler2:(MMPopupItemHandler)handler2;

/**
 * 显示含有输入框的Alert
 * @param title 标题
 * @param detail 内容文字
 * @param text 输入框内预置文字
 * @param inputHandler 文字处理回调
 */
+ (void)showInputView:(NSString *)title detail:(NSString *)detail text:(NSString *)text handler:(MMPopupInputHandler)inputHandler;

@end
