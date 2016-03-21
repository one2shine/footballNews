//
//  FTLocalWomenTeamController.m
//  FootNews
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTLocalWomenTeamController.h"

@interface FTLocalWomenTeamController ()

@end

@implementation FTLocalWomenTeamController

- (NSMutableDictionary *)setupRequestNewParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"女足";
    params[@"opc"] = @(20);
    params[@"type"] = @"中国足球";
    params[@"uid"] = @"5632";
    return params;
}
- (NSMutableDictionary *)setupRequestMoreParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"女足";
    params[@"opc"] = @(20);
    params[@"type"] = @"中国足球";
    params[@"uid"] = @"5632";
    return params;
    
}

@end
