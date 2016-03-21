//
//  FTTopWindow.m
//  FootNews
//
//  Created by mac on 16/3/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTTopWindow.h"

@implementation FTTopWindow
static UIWindow *window_;

+ (void)initialize
{
    window_ = [[UIWindow alloc] init];
    FTTopWindowController *VC = [[FTTopWindowController alloc] initWithNibName:nil bundle:nil];
    window_.rootViewController = VC;
    window_.windowLevel = UIWindowLevelAlert;
    
    window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window_.backgroundColor = [UIColor clearColor];
    
    [window_ addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(windowClicked)]];
    
}
+(void)windowClicked
{
    
   
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    [self searchScrollViewInView:keyWindow];
   
}

+ (void)searchScrollViewInView:(UIView *)view
{
    for (UIScrollView *subView in view.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]] && [self isShowingOnScreen:subView]) {
            CGPoint offset = subView.contentOffset;
            offset.y = - subView.contentInset.top;
            [subView setContentOffset:offset animated:YES];
        }
        [self searchScrollViewInView:subView];
    }
}
+ (void)show
{
    window_.hidden = NO;
}
+ (void)hide
{
    window_.hidden = YES;
}

+ (BOOL)isShowingOnScreen:(UIView *)view
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    CGRect newframe = [view.superview convertRect:view.frame toView:keyWindow];
    BOOL intersects = CGRectIntersectsRect(keyWindow.bounds, newframe);
    
    return !view.hidden && view.alpha > 0.01 && view.window == keyWindow && intersects;
}
@end
