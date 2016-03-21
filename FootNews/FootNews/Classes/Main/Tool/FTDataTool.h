//
//  FTDataTool.h
//  FootNews
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FTFootBallNews;

@interface FTDataTool : NSObject
+ (void)saveNewsVideo:(FTFootBallNews *)newsVideo;

+ (NSArray *)collectionNewsVideoes;

+ (void)removeNewsFromDatabase:(FTFootBallNews *)newsVideo;

+ (BOOL)existNewsVideo:(FTFootBallNews *)newsVideo;

@end
