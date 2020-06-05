//
//  NSDate+FormatTools.m
//  Tami
//
//  Created by Roman Mironenko on 2016-07-04.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "NSDate+FormatTools.h"

@implementation NSDate (FormatTools)

+ (NSDateFormatter *)sharedFormatter {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
    });
    return dateFormatter;
}

+ (NSDate *)getDateFromSystemMilisecond:(NSString *)systemMilisecond {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:([systemMilisecond longLongValue]/1000)];
    
    return date;
}

+ (NSString *)getSystemMilisecondFromDate:(NSDate *)date {
    long long milliseconds = (long long)([date timeIntervalSince1970] * 1000.0);
    NSString *currentTimeString = @(milliseconds).stringValue;
    
    return currentTimeString;
}

+ (NSDate *)getRoundedDate:(NSDate *)inDate interval:(int)interval {
    int minuteInterval = interval * 60;
    NSTimeInterval seconds = round([inDate timeIntervalSinceReferenceDate]/minuteInterval)*minuteInterval;
    NSDate *roundedDate = [NSDate dateWithTimeIntervalSinceReferenceDate:seconds];
    return roundedDate;
}

+ (NSString *)formatDateWithFormat:(NSString *)currentFormat toFormat:(NSString *)toFormat dateString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [self sharedFormatter];
    
    [dateFormatter setDateFormat:currentFormat];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    [dateFormatter setDateFormat:toFormat];
    NSString *formattedString = [dateFormatter stringFromDate:date];
    
    return formattedString;
}

+ (NSString *)formatSystemMilisecondDate:(NSString *)milisecond toFormat:(NSString *)toFormat {
    NSDateFormatter *dateFormatter = [self sharedFormatter];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:([milisecond longLongValue]/1000)];
    [dateFormatter setDateFormat:toFormat];
    NSString *formattedString = [dateFormatter stringFromDate:date];
    
    return formattedString;
}

@end
