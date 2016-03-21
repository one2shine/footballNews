//
//  const.h
//  football
//
//  Created by mac on 16/2/25.
#import "UIView+Extension.h"
//#import <UIKit/UIKit.h>
#define FTMainGreenColor [UIColor colorWithRed:54/255.0 green:95/255.0 blue:26/255.0 alpha:1.0]
#define FTRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define FTColorWith(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width 
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height
// 新闻页内容顶部offset
#define kTopOffset 64
#define kRequestUrl @"http://api.football.app887.com/api/Articles.action?keyword=&"
//extern NSString * const requestUrl;
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
extern  NSString * const FTLeftSideViewButtonDidClickedNotification;
extern  NSString * const FTLeftSideViewButtonTypeKey;

extern NSString * const FTNavigationBarLeftShowSideViewButtonClickedNotification;