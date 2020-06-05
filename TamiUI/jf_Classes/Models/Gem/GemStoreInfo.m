//
//  GemStoreInfo.m
//  TamiUI
//
//  Created by Roman Mironenko on 2016-08-19.
//  Copyright © 2016 Charles Wen1. All rights reserved.
//

#import "GemStoreInfo.h"
#import "GemStoreItem.h"

@implementation GemStoreInfo

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"storeItems" : [GemStoreItem class]};
}

@end
