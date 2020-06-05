//
//  PostContent.m
//  Tami
//
//  Created by Roman Mironenko on 2016-06-28.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "BlipDetail.h"
#import "BlipTag.h"
#import "BlipComment.h"

@implementation BlipDetail

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"imageUrl" : @[@"ImageUrl", @"imageUrl"],
             @"textContent" : @"TextContent",
             @"createdBy" : @[@"CreatedBy", @"createdBy"],
             @"dateTime" : @"DateTime",
             @"likeCount" : @[@"LikeCount", @"likeCount"],
             @"commentCount" : @[@"CommentCount", @"commentCount"],
             @"tags": @"Tags",
             @"comments": @"Comments"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"tags" : [BlipTag class],
             @"comments" : [BlipComment class]};
}


@end
