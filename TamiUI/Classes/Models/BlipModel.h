//
//  BlipModel.h
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface BlipModel : JSONModel

@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, strong) NSString * markerId;
@property (nonatomic, strong) NSString * markerTitle;
@property (nonatomic, strong) NSString * markerType;
@property (nonatomic, assign) BOOL verified;
@property (nonatomic, assign) double distance;
@property (nonatomic, assign) double radius;          //the unit is meters.
//@property (nonatomic, strong) NSMutableDictionary * details;

-(id)initWithValues:(double)latitude longitude:(double)longitude markerId:(NSString *)markerId markerTitle:(NSString *)markerTitle markerType:(NSString *)markerType verified:(BOOL)verified distance:(double)distance radius:(double)radius details:(NSMutableDictionary *)details;
@end
