//
//  BlipPreview.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-07-15.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "BlipPreview.h"

@implementation BlipPreview

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"imageUrl" : @"ImageUrl",
             @"textContent" : @"TextContent",
             @"createdBy" : @"CreatedBy",
             @"likeCount" : @"LikeCount",
             @"commentCount" : @"CommentCount"};
}

@end
