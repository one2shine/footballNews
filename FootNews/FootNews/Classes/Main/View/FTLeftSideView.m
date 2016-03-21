//
//  FTLeftSideView.m
//  FootNews
//
//  Created by mac on 16/3/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTLeftSideView.h"
#import "const.h"

@interface FTLeftSideView()

- (IBAction)settingBtnClicked:(UIButton *)sender;
- (IBAction)collectionBtnClicked:(UIButton *)sender;
- (IBAction)homeBtnClicked:(UIButton *)sender;

@end

@implementation FTLeftSideView

+ (instancetype)leftSideView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"FTLeftSideView" owner:nil options:nil] lastObject];
}
- (void)awakeFromNib
{
    self.autoresizingMask = NO;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
}
- (IBAction)settingBtnClicked:(UIButton *)sender {
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[FTLeftSideViewButtonTypeKey] = @(sender.tag);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FTLeftSideViewButtonDidClickedNotification object:nil userInfo:userInfo];
    
}

- (IBAction)collectionBtnClicked:(UIButton *)sender {
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[FTLeftSideViewButtonTypeKey] = @(sender.tag);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FTLeftSideViewButtonDidClickedNotification object:nil userInfo:userInfo];
}

- (IBAction)homeBtnClicked:(UIButton *)sender {
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[FTLeftSideViewButtonTypeKey] = @(sender.tag);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FTLeftSideViewButtonDidClickedNotification object:nil userInfo:userInfo];
}
@end
