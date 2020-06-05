//
//  RichTextFieldDelegate.h
//  AppX
//
//  Created by admin on 2015-09-10.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@protocol RichTextBoxDelegateHandler
- (void)richTextFieldDidBeginEditing:(UITextField *)textField;
- (void)richTextFieldDidEndEditing:(UITextField *)textField;
- (BOOL)richTextFieldShouldClear:(UITextField *)textField;
- (BOOL)richTextFieldShouldReturn:(UITextField *)textField;
@end

@interface RichTextFieldDelegate : NSObject <UITextFieldDelegate>
@property (nonatomic, strong) id<RichTextBoxDelegateHandler> delegate;
@end