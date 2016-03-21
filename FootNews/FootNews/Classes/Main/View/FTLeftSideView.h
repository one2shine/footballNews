//
//  FTLeftSideView.h
//  FootNews
//
//  Created by mac on 16/3/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    FTLeftSideViewButtonTypeHome = 0,
    FTLeftSideViewButtonTypeCollection,
    FTLeftSideViewButtonTypeSetting
} FTLeftSideViewButtonType;

@class FTLeftSideView;
@protocol FTLeftSideViewDelegate <NSObject>
@optional

- (void)leftSideView:(FTLeftSideView *)leftSideView didClickButton:(UIButton *)button;

@end
@interface FTLeftSideView : UIView

@property (nonatomic, weak) id<FTLeftSideViewDelegate> delegate;
+ (instancetype)leftSideView;
@end
