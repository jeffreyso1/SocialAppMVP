//
//  BlipModel.m
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "BlipPageModel.h"

@implementation BlipPageModel

-(id)init{
    self = [super init];
    if(self){
     //
    }
    return self;
}

-(id)initWithValues:(double)latitude longitude:(double)longitude imageUrl:(NSString *)imageUrl createdBy:(NSString *)createdBy shortTitle:(NSString*)shortTitle likeCount:(int)likeCount commentCount:(int)commentCount {
    self = [self init];
    if(self){
        self.latitude = latitude;
        self.longitude = longitude;
        self.imageUrl = [NSString stringWithFormat:@"%@",imageUrl];
        self.createdBy = [NSString stringWithFormat:@"%@",createdBy];
        self.shortTitle = [NSString stringWithFormat:@"%@",shortTitle];
        self.likeCount = likeCount;
        self.commentCount = commentCount;
    }
    return self;
}
@end

