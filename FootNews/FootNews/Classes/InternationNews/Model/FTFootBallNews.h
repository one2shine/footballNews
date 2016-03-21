//
//  FTFootBallNews.h
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FTFootBallNews : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imglink;
@property (nonatomic, copy) NSString *content168;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *date;

@property (nonatomic, copy) NSString *videolink;
@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSString *url;

/**
 *  判断收藏显示
 */
@property (nonatomic, assign, getter=isCollected) BOOL collect;

@end
