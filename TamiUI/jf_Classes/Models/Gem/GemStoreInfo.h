//
//  GemStoreInfo.h
//  TamiUI
//
//  Created by Roman Mironenko on 2016-08-19.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "YYModel.h"

@interface GemStoreInfo : NSObject

@property NSString *profileImageUrl;
@property NSNumber *redGemCount;
@property NSNumber *blueGemCount;
@property NSArray *storeItems; // NSArray <GemStoreItem>

@end
