//
//  FTBeginViewController.m
//  FootNews
//
//  Created by mac on 16/3/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTBeginViewController.h"
#import "FTLeftSideView.h"
#import "FTMainController.h"
#import "const.h"
#import "UIView+Extension.h"
#import "FTSettingViewController.h"
#import "FTCollectionVideoViewController.h"
#import "FTNavigationController.h"
#import "FTTopWindow.h"




@interface FTBeginViewController()
@property (nonatomic, assign) BOOL isShowingSideView;
@property (nonatomic, strong) UIButton *cover;
@property (nonatomic, strong) UIViewController *showingViewController;

@property (nonatomic, strong) FTMainController *mainController;
@property (nonatomic, strong) FTNavigationController *collectionNavi;
@property (nonatomic, strong) FTNavigationController *settingNavi;

@property (nonatomic, assign) CGFloat maxMoveX;


@end

@implementation FTBeginViewController
static CGFloat const animationDuration = 0.2f;
static CGFloat const endScale = 0.9;
static CGFloat const endWidthRation = 0.4;


#pragma mark - 控制器懒加载
- (FTNavigationController *)collectionNavi
{
    if (!_collectionNavi) {
        FTCollectionVideoViewController *collectionVC = [[FTCollectionVideoViewController alloc] init];
        _collectionNavi = [[FTNavigationController alloc] initWithRootViewController:collectionVC];
        [self addChildViewController:_collectionNavi];

        self.collectionNavi = _collectionNavi;
    }
    return _collectionNavi;
}
- (FTNavigationController *)settingNavi
{
    if (!_settingNavi) {
        FTSettingViewController *settingVC = [[FTSettingViewController alloc] init];
        
        _settingNavi = [[FTNavigationController alloc] initWithRootViewController:settingVC];
        
        [self addChildViewController:_settingNavi];

        self.settingNavi = _settingNavi;
    }
    return _settingNavi;
}
- (FTMainController *)mainController
{
    if (!_mainController) {
        _mainController = [[FTMainController alloc] init];
        
        [self addChildViewController:_mainController];
        _mainController.view.layer.shadowOffset = CGSizeMake(-5, 5);
        _mainController.view.layer.shadowColor = [UIColor blackColor].CGColor;
        _mainController.view.layer.shadowOpacity = 0.4;
        self.mainController = _mainController;
    }
    return _mainController;
}

- (UIButton *)cover
{
    if (!_cover) {
        _cover = [[UIButton alloc] init];
        _cover.backgroundColor = [UIColor clearColor];
        [_cover addTarget:self action:@selector(coverClicked) forControlEvents:UIControlEventTouchUpInside];
        self.cover = _cover;
    }
    return _cover;
}
#pragma mark - 控制器生命周期方法
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    self.maxMoveX = kScreenWidth * (1 - endWidthRation);
    
    FTLeftSideView *sideView = [FTLeftSideView leftSideView];
    sideView.frame = self.view.bounds;
    [self.view addSubview:sideView];
    
    

    self.showingViewController = self.mainController;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(leftViewBtnClicked:) name:FTLeftSideViewButtonDidClickedNotification object:nil];
    // 监听leftview中button点击发生的通知，进而切换控制器
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(navigationLeftShowSideViewButtonClicked) name:FTNavigationBarLeftShowSideViewButtonClickedNotification object:nil];
    
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panDidMove:)];
    edgePan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePan];

}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - 监听方法
- (void)navigationLeftShowSideViewButtonClicked
{
    if (self.isShowingSideView) {
        [self hideLeftSideView];
    } else {
        [self showLeftSideView];
    }
}
/**
 *  左边sideView的按钮的监听方法
 *
 *  @param noti 通知
 */
- (void)leftViewBtnClicked:(NSNotification *)noti
{
    FTLeftSideViewButtonType type = (FTLeftSideViewButtonType)[noti.userInfo[FTLeftSideViewButtonTypeKey] integerValue];
   
    switch (type) {
        case FTLeftSideViewButtonTypeHome:
            
            self.showingViewController = self.mainController;
            break;
            
        case FTLeftSideViewButtonTypeCollection:
            self.showingViewController = self.collectionNavi;
            break;
            
        case FTLeftSideViewButtonTypeSetting:
            self.showingViewController = self.settingNavi;
            
            break;
            
        default:
            break;
    }
    [self hideLeftSideView];
}
- (void)setShowingViewController:(UIViewController *)showingViewController
{
    [_showingViewController.view removeFromSuperview];
    
    _showingViewController = showingViewController;
    
    [self.view addSubview:showingViewController.view];
    
    self.isShowingSideView = NO;
    
}
- (void)panDidMove:(UIScreenEdgePanGestureRecognizer *)panGesture
{
    
    if(self.isShowingSideView) return;
    

    
    //手势移动的距离
    CGFloat moveX = [panGesture translationInView:self.view].x;
    
    CGFloat scale = moveX / self.maxMoveX *(1 -endScale);
    
    CGAffineTransform transform = CGAffineTransformMakeScale(1-scale, 1 - scale);
    
    self.showingViewController.view.transform = CGAffineTransformTranslate(transform, moveX, 0);
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        if (moveX >= self.maxMoveX / 2) { //确定显示侧边栏
            [self showLeftSideView];
            
        } else { //隐藏侧边栏
            [self hideLeftSideView];
        }
    }
    
}
/**
 *  显示侧边栏
 */
- (void)showLeftSideView
{
    [UIView animateWithDuration:animationDuration animations:^{
        
        CGAffineTransform trans = CGAffineTransformMakeScale(endScale, endScale);
        self.showingViewController.view.transform = CGAffineTransformTranslate(trans, self.maxMoveX, 0);
    } completion:^(BOOL finished) {
        
        
        self.cover.frame = self.mainController.view.bounds;
        [self.showingViewController.view addSubview:self.cover];
        self.isShowingSideView = YES;
    }];
}
/**
 *  显示侧边栏
 */
- (void)hideLeftSideView
{
    self.showingViewController.view.transform = CGAffineTransformIdentity;
}
/**
 *  监听右边view蒙版的点击
 */
- (void)coverClicked
{
    [UIView animateWithDuration:animationDuration animations:^{
        
        self.showingViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.cover removeFromSuperview];
        self.isShowingSideView = NO;
    }];
    
    
}
@end
