//
//  Helper.h
//  TamiUI
//
//  Created by Admin on 2016-06-25.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject
+(Helper *)sharedInstance;
-(BOOL)getLocationPermissionState;
-(NSString *)getDocPathWithFileName:(NSString *)fileName;
-(NSString *)getBundlePathWithFileName:(NSString *)fileName;

@end
