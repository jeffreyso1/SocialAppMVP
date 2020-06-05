//
//  RichTextField.m
//  AppX
//
//  Created by admin on 2015-09-10.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import "RichTextField.h"

@implementation RichTextField
@synthesize textFieldHandler;
@synthesize rDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)manuallyRefresh{
    self.backgroundColor = [self.backgroundColor colorWithAlphaComponent:0.7];
    self.layer.cornerRadius = 5;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    textFieldHandler = [[RichTextFieldDelegate alloc] init];
    [super setDelegate:textFieldHandler];
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

-(void)awakeFromNib{
    [self manuallyRefresh];
}

-(void)textFieldDidChange:(id)sender{
    [rDelegate richTextFieldEditingChanging:sender];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect rect = [super textRectForBounds:bounds];
    UIEdgeInsets insets = UIEdgeInsetsMake(2, 2, 2, 2);
    return UIEdgeInsetsInsetRect(rect, insets);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect rect = [super textRectForBounds:bounds];
    UIEdgeInsets insets = UIEdgeInsetsMake(2, 2, 2, 2);
    return UIEdgeInsetsInsetRect(rect, insets);
}
@end

