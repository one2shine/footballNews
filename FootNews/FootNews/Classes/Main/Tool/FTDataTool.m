//
//  FTDataTool.m
//  FootNews
//
//  Created by mac on 16/3/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTDataTool.h"
#import "FMDatabase.h"
#import "FTFootBallNews.h"

@implementation FTDataTool
static FMDatabase *_db;
static NSMutableArray *_newsVideo;
+ (void)initialize
{
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *Path = [document stringByAppendingPathComponent:@"footballNews.sqlite"];
    _db = [FMDatabase databaseWithPath:Path];
    
    [_db open];
    
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_collectionVideoes (id integer PRIMARY KEY, newsID text, news BLOB NOT NULL);"];
    
    [_db executeUpdateWithFormat:@"CREATE TABLE IF NOT EXISTS t_videos (id integer PRIMARY KEY,newsID text, news BLOB NOT NULL);"];
    
    [_db executeUpdateWithFormat:@"CREATE TABLE IF NOT EXISTS t_news (id integer PRIMARY KEY,newsID text, news BLOB NOT NULL);"];
    
}
/**
 *  判断收藏视频数据库中是否有某数据
 *
 *  @param newsVideo 需要判断的video模型
 *
 *  @return yes表示存在，no不存在
 */
+ (BOOL)existNewsVideo:(FTFootBallNews *)newsVideo
{
    FMResultSet *set = [_db executeQueryWithFormat:@"select * from t_collectionVideoes where newsID = %@;",newsVideo.ID];
    
    while (set.next) {
        NSData *data = [set objectForColumnName:@"news"];
        if (data) {
            return YES;
        }
        
    }
    return NO;
    
}
/**
 *  从视频收藏数据库中删除指定视频
 *
 *  @param newsVideo 要删除的视频模型
 */
+ (void)removeNewsFromDatabase:(FTFootBallNews *)newsVideo
{
    NSString *ID = newsVideo.ID;

    [_db executeUpdateWithFormat:@"delete from t_collectionVideoes where newsID = %@;",ID];

}
+ (void)saveNewsVideo:(FTFootBallNews *)newsVideo
{
    NSData *videoData = [NSKeyedArchiver archivedDataWithRootObject:newsVideo];
    
    
    [_db executeUpdateWithFormat:@"INSERT INTO t_collectionVideoes (newsID,news) VALUES(%@,%@);",newsVideo.ID,videoData];
}
+ (NSArray *)collectionNewsVideoes
{
    FMResultSet *set = [_db executeQuery:@"SELECT * FROM t_collectionVideoes order by id desc;"];
    NSMutableArray *newsVideoes = [NSMutableArray array];
    
    while (set.next) {
        NSData *data = [set objectForColumnName:@"news"];
        FTFootBallNews *news = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [newsVideoes addObject:news];
        
    };
    return newsVideoes;
}
@end
