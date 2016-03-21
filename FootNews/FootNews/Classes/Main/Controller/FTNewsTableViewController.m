//
//  FTNewsTableViewController.m
//  FootNews
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTNewsTableViewController.h"
#import "FTFootBallNews.h"

#import "FTNewsCell.h"
#import "FTNewsDetailController.h"

#import "MJRefresh.h"
#import "MJExtension.h"
#import "FTNetworkTool.h"
#import "const.h"



@interface  FTNewsTableViewController()
@property (nonatomic, strong) NSMutableArray *FootBallNewses;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger npc;

@end

@implementation FTNewsTableViewController
static NSString * const reuseIdentifier = @"newsCell";
- (NSMutableArray *)FootBallNewses
{
    if (!_FootBallNewses) {
        _FootBallNewses = [NSMutableArray array];
    }
    return _FootBallNewses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    MJRefreshHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewNews)];
    self.tableView.mj_header = header;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FTNewsCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    
    
    self.tableView.rowHeight = 310;
    
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreNews)];
    
    
}

- (void)loadMoreNews
{
    
    self.npc++;
    NSMutableDictionary *params = [self setupRequestMoreParams];
    
    params[@"npc"] = @(self.npc);
    
    [FTNetworkTool getWithUrl:kRequestUrl params:params progress:nil success:^(id responseObject) {
        NSDictionary *root = responseObject[@"root"];
        
        [self.FootBallNewses  addObjectsFromArray:[FTFootBallNews mj_objectArrayWithKeyValuesArray:root[@"list"]]];
        
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    [self.tableView.mj_footer endRefreshing];
    
}
- (void)loadNewNews
{
    
    self.npc = 0;
    
    NSMutableDictionary *params = [self setupRequestNewParams];
    
    params[@"npc"] = @(self.npc);
    
    [FTNetworkTool getWithUrl:kRequestUrl params:params progress:nil success:^(id responseObject) {
        
        NSDictionary *root = responseObject[@"root"];
        
        NSInteger count = (NSInteger)root[@"count"];
        if (self.count == count) {
            [self.tableView.mj_header endRefreshing];
            return ;
        }
        self.count = count;
        self.FootBallNewses = [FTFootBallNews mj_objectArrayWithKeyValuesArray:root[@"list"]];
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
        NSLog(@"error");
    }];
    
    [self.tableView.mj_header endRefreshing];
    
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.FootBallNewses.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FTNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    cell.footballNews = self.FootBallNewses[indexPath.row];
    
    
    
    return cell;
}

#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FTFootBallNews *news = self.FootBallNewses[indexPath.row];
    FTNewsDetailController *detailVC = [[FTNewsDetailController alloc] init];
    detailVC.hidesBottomBarWhenPushed = YES;
    detailVC.ID = news.ID;
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
}

@end
