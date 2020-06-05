//
//  FMDBManager.h
//  Tami
//
//  Created by Roman Mironenko on 2015-12-28.
//  Copyright © 2015 Roman Mironenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDatabase.h>

@interface FMDBManager : NSObject

+ (FMDBManager *)sharedInstance;
- (void)setFilePath:(NSString *)fileName;
- (void)initializeTable;
- (void)resetTable;

@property NSString *pathName;
@property BOOL tableCreated;

@end
