//
// Created by 魏博 on 15/09/2017.
// Copyright (c) 2017 魏博. All rights reserved.
//

#import "AlertUtil.h"
#import "MMAlertView.h"
#import "MMSheetView.h"
#import "SVProgressHUD.h"


@implementation AlertUtil {

}
+ (void)showMessageAlert:(NSString *)title detail:(NSString *)detail {
    MMAlertView *alertView = [[MMAlertView alloc] initWithConfirmTitle:title detail:detail];
    [alertView show];
}

+ (void)showMessageAlert:(NSString *)title detail:(NSString *)detail handler:(MMPopupItemHandler)handler {
    MMAlertView *alertView = [[MMAlertView alloc] initWithTitle:title detail:detail items:@[MMItemMake(@"确定", MMItemTypeNormal, handler)]];
    [alertView show];
}


+ (void)showConformAlert:(NSString *)title detail:(NSString *)detail conformTitle:(NSString *)conformTitle conformHandler:(MMPopupItemHandler)conformHandler cancelTitle:(NSString *)cancelTitle cancelHandler:(MMPopupItemHandler)cancelHandler {
    MMPopupItem *conformItem = MMItemMake(conformTitle, MMItemTypeHighlight, conformHandler);
    MMPopupItem *cancelItem = MMItemMake(cancelTitle, MMItemTypeNormal, cancelHandler);
    MMAlertView *alertView = [[MMAlertView alloc] initWithTitle:title detail:detail items:@[cancelItem, conformItem]];
    
    [alertView show];
}

+ (void)showDestructiveActionSheet:(NSString *)title buttonTitle:(NSString *)buttonTitle handler:(MMPopupItemHandler)handler {
    MMPopupItem *item = MMItemMake(buttonTitle, MMItemTypeHighlight, handler);
    MMSheetView *sheetView = [[MMSheetView alloc] initWithTitle:title items:@[item]];
    [sheetView show];
}

+ (void)showActionSheet:(NSString *)title button1:(NSString *)button1Title handler1:(MMPopupItemHandler)handler1 button2:(NSString *)button2Title handler2:(MMPopupItemHandler)handler2 {
    MMPopupItem *item1 = MMItemMake(button1Title, MMItemTypeNormal, handler1);
    MMPopupItem *item2 = MMItemMake(button2Title, MMItemTypeNormal, handler2);
    MMSheetView *sheetView = [[MMSheetView alloc] initWithTitle:title items:@[item1, item2]];
    
    [sheetView show];
}

+ (void)showInputView:(NSString *)title detail:(NSString *)detail text:(NSString *)text handler:(MMPopupInputHandler)inputHandler {
    MMAlertView *alertView = [[MMAlertView alloc] initWithInputTitle:title detail:detail placeholder:nil handler:inputHandler];
    alertView.maxInputLength = 6;
    
    UITextField *textField = alertView.inputView;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.placeholder = text;
    textField.font = [UIFont systemFontOfSize:13];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [alertView show];
}

+ (void)showFSActionSheetWithTitle:(NSString *)title delegate:(id<FSActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancleTitle highlightedButtonTitle:(NSString *)highlightedButtonTitle otherButtonTitles:(NSArray *)otherButtonTitles selectedHandler:(FSActionSheetHandler)selectedHandler {
    
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:title delegate:delegate cancelButtonTitle:cancleTitle highlightedButtonTitle:highlightedButtonTitle otherButtonTitles:otherButtonTitles];
    
    [actionSheet showWithSelectedCompletion:selectedHandler];
    
}

@end
