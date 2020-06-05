//
//  BlipCellWrapper.m
//  TamiLab
//
//  Created by Admin on 2016-05-26.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "BlipCellWrapper.h"

@implementation BlipCellWrapper

- (instancetype)initWithImage:(NSString*)imageName withText:(NSString*)text withIconName:(NSString*)iconName {
    BlipCellWrapper *wrapper=[BlipCellWrapper alloc];
    wrapper.imageName=imageName;
    wrapper.text=text;
    wrapper.iconName=iconName;
    return wrapper;
}
@end
