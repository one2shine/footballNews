//
//  FTMainController.m
//  football
//
//  Created by mac on 16/2/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTMainController.h"


#import "FTSplendidVideoController.h"
#import "FTMainSectionController.h"

#import "const.h"
#import "FTNavigationController.h"
#import "FTLeftSideView.h"
//#import "UIScrollView+extension.h"

@implementation FTMainController

//第一次初始化tabbar控制器，做样式定制
+ (void)initialize
{
    

    UITabBar *bar = [UITabBar appearance];
    bar.tintColor = FTMainGreenColor;
 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // 设置国际足球新闻页控制器
    [self settupInternationalNewsController];
    
    //设置国内足球新闻页控制器
    [self setupLocalNewsController];
    
    //设置精彩视频页面控制器
    [self setupSplendidVideoController];
   
   
    
}
- (void)settupInternationalNewsController
{
    FTMainSectionController *interVC = [[FTMainSectionController alloc] init];
    
    interVC.indicatorTitles = @[@"最新",@"英超",@"西甲",@"德甲",@"意甲"];
    interVC.controllerNames = @[@"FTNewestControler",@"FTEnglandController",@"FTSpanishController",@"FTGermanyController",@"FTItalyController"];
    
    FTNavigationController *interNaviVC = [[FTNavigationController alloc] initWithRootViewController:interVC];
    //    interNaviVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"like_video_1"] style:UIBarButtonItemStylePlain target:self action:@selector(<#selector#>)];
    [self addChildViewController:interNaviVC];
    interNaviVC.tabBarItem.image = [UIImage imageNamed:@"news_1"];
    interVC.title = @"国际足球";

}
- (void)setupLocalNewsController
{
    FTMainSectionController *localVC = [[FTMainSectionController alloc] init];
    localVC.indicatorTitles = @[@"最新",@"中超",@"国足",@"女足",@"中甲"];
    localVC.controllerNames = @[@"FTLocalNewestController",@"FTLocalSuperLeagueController",@"FTLocalChinaTeamController",@"FTLocalWomenTeamController",@"FTLocalLowerLeagueController"];
    FTNavigationController *localNaviVC = [[FTNavigationController alloc] initWithRootViewController:localVC];
    [self addChildViewController:localNaviVC];
    localNaviVC.tabBarItem.image = [UIImage imageNamed:@"list_1"];
    localVC.title = @"中国足球";

}
- (void)setupSplendidVideoController
{
    FTSplendidVideoController *videoVC = [[FTSplendidVideoController alloc] init];
    FTNavigationController *VideoNaviVC = [[FTNavigationController alloc] initWithRootViewController:videoVC];
    [self addChildViewController:VideoNaviVC];
    VideoNaviVC.tabBarItem.image = [UIImage imageNamed:@"shipin_1"];
    videoVC.title = @"精彩视频";
}

@end
