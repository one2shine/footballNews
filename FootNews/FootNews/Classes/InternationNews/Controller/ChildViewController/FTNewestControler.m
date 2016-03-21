//
//  FTNewestControler.m
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTNewestControler.h"
#import "FTFootBallNews.h"
#import "MJRefresh.h"

#import "MJExtension.h"
#import "FTNewsCell.h"

#import "FTNetworkTool.h"
#import "const.h"



@interface FTNewestControler ()
//@property (nonatomic, strong) NSMutableArray *FootBallNewses;
//@property (nonatomic, assign) NSInteger count;
//@property (nonatomic, assign) NSInteger npc;

@end

@implementation FTNewestControler


- (NSMutableDictionary *)setupRequestNewParams
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"opc"] = @(20);
    params[@"type"] = @"国际足球";
    params[@"uid"] = @"5632";
    return params;
}
- (NSMutableDictionary *)setupRequestMoreParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"opc"] = @(20);
    params[@"type"] = @"国际足球";
    params[@"uid"] = @"5632";
    return params;

}
@end
