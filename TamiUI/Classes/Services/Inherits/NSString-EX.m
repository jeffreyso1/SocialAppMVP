//
//  NSString-EX.m
//  Dido
//
//  Created by admin on 2015-04-30.
//  Copyright (c) 2015 GreenOwl Mobile. All rights reserved.
//

#import "NSString-EX.h"

@implementation NSString (NSString_EX)

- (NSString *)urlEncodedString
{
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                 kCFStringEncodingUTF8);
}

-(NSString *)urlDecodedString
{
    NSString *decodeString = [[self
                               stringByReplacingOccurrencesOfString:@"+" withString:@" "]
                              stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return decodeString;
}
@end
