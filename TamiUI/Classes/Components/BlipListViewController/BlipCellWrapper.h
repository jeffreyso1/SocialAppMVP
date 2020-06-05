//
//  BlipCellWrapper.h
//  TamiLab
//
//  Created by Admin on 2016-05-26.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlipCellWrapper : NSObject
@property (nonatomic, strong) NSString* imageName;
@property (nonatomic, strong) NSString* text;
@property (nonatomic, strong) NSString* iconName;
- (instancetype)initWithImage:(NSString*)imageName withText:(NSString*)text withIconName:(NSString*)iconName;
@end
