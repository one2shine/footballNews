//
//  FTMainSectionController.m
//  FootNews
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTMainSectionController.h"


#import "FTNewestControler.h"
#import "FTEnglandController.h"
#import "FTSpanishController.h"
#import "FTGermanyController.h"
#import "FTItalyController.h"
#import "FTIndicatorLabel.h"
#import "FTLocalNewestController.h"
#import "FTLocalLowerLeagueController.h"
#import "FTLocalChinaTeamController.h"
#import "FTLocalSuperLeagueController.h"
#import "FTLocalWomenTeamController.h"

#import "FTNewsScrollView.h"

#import "const.h"

const CGFloat kIndicatorBarHeight = 20;


@interface FTMainSectionController()<UIScrollViewDelegate>
@property (nonatomic, weak) UIView *indicatorBar;
@property (nonatomic, weak) FTNewsScrollView *contentView;
@property (nonatomic, strong) FTIndicatorLabel *selectIndicatorLabel;

@end
@implementation FTMainSectionController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(btnClicked)];
    
    [self setupIndicatorBar];
    
    [self setupChildVC];
    
    [self setupContentView];
    
    [self scrollViewDidEndScrollingAnimation:self.contentView];
    
    
}

- (void)btnClicked
{
    [[NSNotificationCenter defaultCenter] postNotificationName:FTNavigationBarLeftShowSideViewButtonClickedNotification object:nil];
}
/**
 *  设置并添加显示新闻内容的scorllView，
 */
- (void)setupContentView
{
    
    //创建contentview，并进行基本设置
    FTNewsScrollView *contentView = [[FTNewsScrollView alloc] init];
    contentView.showsHorizontalScrollIndicator = NO;
    contentView.alwaysBounceHorizontal = NO;
    contentView.showsVerticalScrollIndicator = NO;
    contentView.pagingEnabled = YES;
    contentView.scrollsToTop = NO;
    
    // 计算contentView的frame
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.x = 0;
    contentView.y = CGRectGetMaxY(self.indicatorBar.frame);
    contentView.width = kScreenWidth;
    contentView.height = kScreenHeight - contentView.y;
    
    
    [self.view addSubview:contentView];
    contentView.delegate = self;
    self.contentView = contentView;
    
    //设置contentSize
    CGFloat contentWidth = self.childViewControllers.count * kScreenWidth;
    
    contentView.contentSize = CGSizeMake(contentWidth, 0);
    
    
    
}
/**
 *  添加导航栏下方栏目指示条
 */
- (void)setupIndicatorBar
{
    NSInteger count = self.indicatorTitles.count;
    
    if (!count) return;
    
    CGFloat itemW = kScreenWidth / count;
    
    UIView *indicatorBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, kIndicatorBarHeight)];
    [self.view addSubview:indicatorBar];
    self.indicatorBar = indicatorBar;
    
    
    indicatorBar.backgroundColor = [UIColor whiteColor];
    
    for (NSInteger i = 0; i<count; i++) {
        FTIndicatorLabel *label = [[FTIndicatorLabel alloc] init];
        
        label.text =self.indicatorTitles[i];
        
        label.tag = i;
        label.frame = CGRectMake(i*itemW, 0, itemW, kIndicatorBarHeight);
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelDidClicked:)]];
        [indicatorBar addSubview:label];
    }
   
    
}
/**
 *  添加子控制器
 */
- (void)setupChildVC
{
    for (NSString *VCClass in self.controllerNames) {
        
        
        UIViewController *VC = (UIViewController *)[[NSClassFromString(VCClass) alloc] init];
        
        [self addChildViewController:VC];
    }
    

}
#pragma mark - 指示条label手势的监听方法
- (void)labelDidClicked:(UITapGestureRecognizer *)tap
{
    NSInteger index = [self.indicatorBar.subviews indexOfObject:tap.view];
    [self.contentView setContentOffset:CGPointMake(index *kScreenWidth, 0) animated:YES];
    
}

#pragma mark - contentView(scrollView)的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetX = scrollView.contentOffset.x;
    if (offsetX < 0) {
        
        scrollView.contentOffset = CGPointMake(0, 0);
    }
    NSInteger index = offsetX / kScreenWidth + 0.5;
    
    FTIndicatorLabel *label = self.indicatorBar.subviews[index];
    self.selectIndicatorLabel.selected = NO;
    label.selected = YES;
    self.selectIndicatorLabel = label;
    
    
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //根据滑动的偏移位置判断当前子控制器的索引
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger index = offsetX / kScreenWidth;
    
    
    
    UIViewController *VC = self.childViewControllers[index];
    
    
    //判断该控制器的view是否已经加载
    if ([VC isViewLoaded]) return;
    
    
    
    
    
    VC.view.bounds = self.contentView.bounds;
    VC.view.x = index * kScreenWidth;
    VC.view.y = 0;
    //    VC.view.backgroundColor = FTRandomColor;
    
    [self.contentView addSubview:VC.view];
    
    [self scrollViewDidScroll:scrollView];
    
    [self checkVisibleView];
}


- (void)checkVisibleView
{
    
}
@end