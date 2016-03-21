//
//  FTFileManager.m
//  FootNews
//
//  Created by mac on 16/3/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTFileManager.h"

@interface FTFileManager()<NSCopying>

@end

@implementation FTFileManager
static FTFileManager *_manager;
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [super allocWithZone:zone];
    });
    return _manager;
}
+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}
- (id)copyWithZone:(NSZone *)zone
{
    return _manager;
}

+ (NSString *)getAppVersion
{
    return  [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"];
}

+ (void)clearCache
{
    
        
        NSFileManager *manager = [NSFileManager defaultManager];
        NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        
        NSArray *subPathes = [manager subpathsAtPath:caches];
        for (NSString *subPath in subPathes) {
            NSString *fullPath = [caches stringByAppendingPathComponent:subPath];
            if ([manager fileExistsAtPath:fullPath]) {
                
                [manager removeItemAtPath:fullPath error:nil];
            }
        }
    
    
    
    
}
/**
 *  返回沙盒cache文件夹大小
 *
 *  @return 沙盒中cache文件夹的大小
 */
+ (NSInteger)getCacheDirectorySize
{
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return  [self fileSizeAtPath:caches];
    
}
+ (NSInteger)fileSizeAtPath:(NSString *)path
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    BOOL dir = NO;
    BOOL exist = [mgr fileExistsAtPath:path isDirectory:&dir];
    if (!exist) return 0;
    if (dir) {
        
        NSArray *subPaths = [mgr subpathsAtPath:path];
        BOOL dir = NO;
        NSInteger totalSize = 0;
        for (NSString *subPath  in subPaths) {
            NSString *fullPath = [path stringByAppendingPathComponent:subPath];
            [mgr fileExistsAtPath:fullPath isDirectory:&dir];
            if (dir == NO) {
                totalSize += [[mgr attributesOfItemAtPath:fullPath error:nil][NSFileSize] integerValue];
            }
        }
        return totalSize;
    } else {
        return [[mgr attributesOfItemAtPath:path error:nil][NSFileSize] integerValue];
    }
}

@end
