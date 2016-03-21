//
//  FTNavigationController.m
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTNavigationController.h"
#import "const.h"

@interface FTNavigationController ()

@end

@implementation FTNavigationController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
    [bar setTintColor:FTMainGreenColor];
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
//    [item setTintColor:FTMainGreenColor];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.layer.shadowOffset = CGSizeMake(-5, 5);
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.view.layer.shadowOpacity = 0.4;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];

    
}



@end
