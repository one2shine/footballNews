//
//  FTSplendidVideoController.m
//  football
//
//  Created by mac on 16/2/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTSplendidVideoController.h"
#import "FTVideoViewCell.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "FTNetworkTool.h"
#import "const.h"
#import "FTFootBallNews.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>






@interface FTSplendidVideoController ()
@property (nonatomic, strong) NSMutableArray *videoes;

@property (nonatomic, assign) NSInteger npc;


@end

@implementation FTSplendidVideoController

- (NSMutableArray *)videoes
{
    if (!_videoes) {
        _videoes = [NSMutableArray array];
        
    }
    return _videoes;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(btnClicked)];

    self.tableView.rowHeight = 200;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewVideoes)];
    
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreVideoes)];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)btnClicked
{
    [[NSNotificationCenter defaultCenter] postNotificationName:FTNavigationBarLeftShowSideViewButtonClickedNotification object:nil];
}
- (void)loadMoreVideoes
{
    self.npc ++;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"type"] = @"精彩视频";
    params[@"opc"] = @"10";
    params[@"uid"] = @"5632";
    params[@"npc"] = @(self.npc);
    
    [FTNetworkTool getWithUrl:kRequestUrl params:params progress:nil success:^(id responseObject) {
        NSDictionary *root = responseObject[@"root"];
        
        NSArray *moreVideoes = [FTFootBallNews mj_objectArrayWithKeyValuesArray:root[@"list"]];
        [self.videoes addObjectsFromArray:moreVideoes];
        
    
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
       [self.tableView.mj_footer endRefreshing];
    }];
}
- (void)loadNewVideoes
{
    
    self.npc = 0;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"type"] = @"精彩视频";
    params[@"opc"] = @"10";
    params[@"uid"] = @"5632";
    params[@"npc"] = @(self.npc);
    
    [FTNetworkTool getWithUrl:kRequestUrl params:params progress:nil success:^(id responseObject) {
        
        NSDictionary *root = responseObject[@"root"];
        
        NSArray *newVideoes = [FTFootBallNews mj_objectArrayWithKeyValuesArray:root[@"list"]];
        
        
        [self.videoes addObjectsFromArray:newVideoes];
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
        [self.tableView.mj_header endRefreshing];
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.videoes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FTVideoViewCell *cell = [FTVideoViewCell videoCellWithTabelView:tableView];
    
    cell.news = self.videoes[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FTFootBallNews *news = self.videoes[indexPath.row];

    
    AVPlayerViewController *videoPlayerVC = [[AVPlayerViewController alloc] init];

    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:news.videolink]];
    videoPlayerVC.player = player;
   
    [self presentViewController:videoPlayerVC animated:YES completion:nil];
}


@end
