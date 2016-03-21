//
//  FTGermanyController.m
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTGermanyController.h"

@interface FTGermanyController ()

@end

@implementation FTGermanyController
- (NSMutableDictionary *)setupRequestNewParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"德甲";
    params[@"opc"] = @(20);
    params[@"type"] = @"国际足球";
    params[@"uid"] = @"5632";
    return params;
}
- (NSMutableDictionary *)setupRequestMoreParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"德甲";
    params[@"opc"] = @(20);
    params[@"type"] = @"国际足球";
    params[@"uid"] = @"5632";
    return params;
    
}

@end
