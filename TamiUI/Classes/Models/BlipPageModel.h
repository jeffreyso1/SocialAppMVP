//
//  BlipModel.h
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface BlipPageModel : JSONModel

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, strong) NSString * imageUrl;
@property (nonatomic, strong) NSString * createdBy;
@property (nonatomic, strong) NSString * shortTitle;
@property (nonatomic, assign) int likeCount;
@property (nonatomic, assign) int commentCount;
// Tags, comments

-(id)initWithValues:(double)latitude longitude:(double)longitude imageUrl:(NSString *)imageUrl createdBy:(NSString *)createdBy shortTitle:(NSString*)shortTitle likeCount:(int)likeCount commentCount:(int)commentCount;
@end
