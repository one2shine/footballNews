//
//  FTItalyController.m
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTItalyController.h"

@interface FTItalyController ()

@end

@implementation FTItalyController
- (NSMutableDictionary *)setupRequestNewParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"意甲";
    params[@"opc"] = @(20);
    params[@"type"] = @"国际足球";
    params[@"uid"] = @"5632";
    return params;
}
- (NSMutableDictionary *)setupRequestMoreParams
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"sourceName"] = @"意甲";
    params[@"opc"] = @(20);
    params[@"type"] = @"国际足球";
    params[@"uid"] = @"5632";
    return params;
    
}

@end
