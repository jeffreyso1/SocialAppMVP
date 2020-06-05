//
//  BlipModel.m
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "BlipModel.h"

@implementation BlipModel
-(id)init{
    self = [super init];
    if(self){
        _radius = 200;
    }
    return self;
}

-(id)initWithValues:(double)latitude longitude:(double)longitude markerId:(NSString *)markerId markerTitle:(NSString *)markerTitle markerType:(NSString *)markerType verified:(BOOL)verified distance:(double)distance radius:(double)radius details:(NSMutableDictionary *)details {
    self = [self init];
    if(self){
        self.latitude = latitude;
        self.longitude = longitude;
        self.markerId = [NSString stringWithFormat:@"%@",markerId];
        self.markerTitle = [NSString stringWithFormat:@"%@",markerTitle];
        self.markerType = [NSString stringWithFormat:@"%@",markerType];
        self.verified = verified;
        self.distance = distance;
        self.radius = radius;
//        if(details != nil){
//            self.details = [[NSMutableDictionary alloc] initWithDictionary:details];
//        }else{
//            self.details = nil;
//        }
    }
    return self;
}
@end
