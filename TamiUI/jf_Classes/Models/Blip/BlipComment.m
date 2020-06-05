//
//  PostComment.m
//  Tami
//
//  Created by Roman Mironenko on 2016-06-28.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "BlipComment.h"

@implementation BlipComment

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"commentBy" : @[@"CommentBy", @"commentBy"],
             @"commentText" : @[@"CommentText", @"commentText"],
             @"commentDateTime" : @[@"CommentDateTime", @"commentDateTime"]};
}

@end
