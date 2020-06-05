//
//  PostContent.h
//  Tami
//
//  Created by Roman Mironenko on 2016-06-28.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "YYModel.h"

@interface BlipDetail : NSObject

@property NSString *imageUrl;
@property NSString *textContent;
@property NSString *createdBy;
@property NSString *dateTime;
@property NSNumber *likeCount;
@property NSNumber *commentCount;
@property NSArray *tags; //NSArray<BlipTag>
@property NSArray *comments; //NSArray<BlipComment>

@end
