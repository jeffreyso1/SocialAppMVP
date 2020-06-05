//
//  NSDate+FormatTools.h
//  Tami
//
//  Created by Roman Mironenko on 2016-07-04.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FormatTools)

+ (NSDate *)getDateFromSystemMilisecond:(NSString *)systemMilisecond;
+ (NSString *)getSystemMilisecondFromDate:(NSDate *)date;
+ (NSDate *)getRoundedDate:(NSDate *)inDate interval:(int)interval;

+ (NSString *)formatDateWithFormat:(NSString *)currentFormat toFormat:(NSString *)toFormat dateString:(NSString *)dateString;
+ (NSString *)formatSystemMilisecondDate:(NSString *)milisecond toFormat:(NSString *)toFormat;

@end
