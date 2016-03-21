//
//  FTLocalNewestController.m
//  FootNews
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTLocalNewestController.h"

@interface FTLocalNewestController ()

@end

@implementation FTLocalNewestController

- (NSMutableDictionary *)setupRequestNewParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"opc"] = @(20);
    params[@"type"] = @"中国足球";
    params[@"uid"] = @"5632";
    return params;
}
- (NSMutableDictionary *)setupRequestMoreParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"opc"] = @(20);
    params[@"type"] = @"中国足球";
    params[@"uid"] = @"5632";
    return params;
    
}

@end
