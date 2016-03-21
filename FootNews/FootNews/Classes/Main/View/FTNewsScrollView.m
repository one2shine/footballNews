//
//  FTNewsScrollView.m
//  FootNews
//
//  Created by mac on 16/3/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTNewsScrollView.h"

@implementation FTNewsScrollView
- (BOOL)alwaysBounceHorizontal
{
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        if (self.contentOffset.x <= 0) {
            return YES;
        } else {
            return NO;
        }
        
    } else {
        
        return NO;
    }
   
}
@end
