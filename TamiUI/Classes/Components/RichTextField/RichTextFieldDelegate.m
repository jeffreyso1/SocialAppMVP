//
//  RichTextFieldDelegate.m
//  AppX
//
//  Created by admin on 2015-09-10.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import "RichTextFieldDelegate.h"

@implementation RichTextFieldDelegate
@synthesize delegate;

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.delegate richTextFieldDidBeginEditing:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.delegate richTextFieldDidEndEditing:textField];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return [self.delegate richTextFieldShouldClear:textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [self.delegate richTextFieldShouldReturn:textField];
}

@end
