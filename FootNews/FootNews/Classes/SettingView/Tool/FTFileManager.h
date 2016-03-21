//
//  FTFileManager.h
//  FootNews
//
//  Created by mac on 16/3/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTFileManager : NSObject

+ (NSString *)getAppVersion;
+ (void)clearCache;
+ (instancetype)shareManager;
+ (NSInteger)fileSizeAtPath:(NSString *)path;

+ (NSInteger)getCacheDirectorySize;

@end
