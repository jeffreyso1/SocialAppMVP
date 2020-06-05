//
//  RichTextField.h
//  AppX
//
//  Created by admin on 2015-09-10.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RichTextFieldDelegate.h"

@protocol RichTextFieldDelegateExtension <NSObject>
- (void)richTextFieldEditingChanging:(UITextField *)textField;
@end

@interface RichTextField : UITextField
@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * placeId;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double log;
@property (nonatomic, strong) id<RichTextFieldDelegateExtension> rDelegate;
@property (nonatomic, strong) RichTextFieldDelegate * textFieldHandler;
-(void)manuallyRefresh;
@end
