//
//  FTEnglandController.m
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTEnglandController.h"

@interface FTEnglandController ()

@end

@implementation FTEnglandController

- (NSMutableDictionary *)setupRequestNewParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"英超";
    params[@"opc"] = @(20);
    params[@"type"] = @"国际足球";
    params[@"uid"] = @"5632";
    return params;
}
- (NSMutableDictionary *)setupRequestMoreParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"英超";
    params[@"opc"] = @(20);
    params[@"type"] = @"国际足球";
    params[@"uid"] = @"5632";
    return params;
    
}
@end
