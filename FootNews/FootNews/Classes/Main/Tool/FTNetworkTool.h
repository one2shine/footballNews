//
//  FTNetworkTool.h
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FTNetworkTool : NSObject

+ (void)getWithUrl:(NSString *)url params:(NSDictionary *)params progress:(void (^)(NSProgress *))progress success:(void (^)(id responseObject))success failure:(void(^)(NSError *))failure;

@end
