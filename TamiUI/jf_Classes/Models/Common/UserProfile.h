//
//  User.h
//  Tami
//
//  Created by Roman Mironenko on 2016-06-28.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "YYModel.h"

@interface UserProfile : NSObject

@property NSString *name;
@property NSString *headerImageUrl;
@property NSString *profilePhotoUrl;
@property NSNumber *followerCount;
@property NSNumber *blipCount;
@property NSString *profileTagline;
@property NSString *profileBio;
@property NSString *website;
@property NSString *location;
@property NSNumber *gemCount;

@end
