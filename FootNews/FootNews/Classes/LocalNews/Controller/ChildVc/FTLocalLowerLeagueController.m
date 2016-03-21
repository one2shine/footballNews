//
//  FTLocalLowerLeagueController.m
//  FootNews
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTLocalLowerLeagueController.h"

@interface FTLocalLowerLeagueController ()

@end

@implementation FTLocalLowerLeagueController

- (NSMutableDictionary *)setupRequestNewParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"中甲";
    params[@"opc"] = @(20);
    params[@"type"] = @"中国足球";
    params[@"uid"] = @"5632";
    return params;
}
- (NSMutableDictionary *)setupRequestMoreParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"中甲";
    params[@"opc"] = @(20);
    params[@"type"] = @"中国足球";
    params[@"uid"] = @"5632";
    return params;
    
}

@end
