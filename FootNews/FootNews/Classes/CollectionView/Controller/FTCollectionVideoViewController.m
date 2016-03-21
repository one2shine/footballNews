//
//  FTCollectionVideoViewController.m
//  FootNews
//
//  Created by mac on 16/3/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTCollectionVideoViewController.h"
#import "FTFootBallNews.h"
#import "FTDataTool.h"
#import "FTCollectionVideoCell.h"
#import "const.h"

@interface FTCollectionVideoViewController()<FTCollectionVideoCellDelegate>

@property (nonatomic, strong) NSArray *videos;
@end
@implementation FTCollectionVideoViewController
static NSString * const reuseID = @"videoCell";
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"收藏视频";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(btnClicked)];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FTCollectionVideoCell" bundle:nil] forCellReuseIdentifier:reuseID];
    
    self.tableView.rowHeight = 280;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    
}
- (NSArray *)videos
{
    
   _videos = [FTDataTool collectionNewsVideoes];
    
    return _videos;
}

#pragma mark - collectionVideoCell 的delegate方法
- (void)collectionVideoCell:(FTCollectionVideoCell *)collectionVideoCell didSelectRomoveNewsVideo:(FTFootBallNews *)newsVideo
{
    [FTDataTool removeNewsFromDatabase:newsVideo];
    [self.tableView reloadData];

}
//点击导航栏leftitem，进入leftview
- (void)btnClicked
{
    [[NSNotificationCenter defaultCenter] postNotificationName:FTNavigationBarLeftShowSideViewButtonClickedNotification object:nil];
}
#pragma mark - tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.videos.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FTCollectionVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    
    cell.news = self.videos[indexPath.row];
    cell.delegate = self;
    
    return cell;
}
#pragma mark - tableview delegate
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setEditing:YES animated:YES];
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",self.videos.count);
    FTFootBallNews *newsVideo = self.videos[indexPath.row];
    [FTDataTool removeNewsFromDatabase:newsVideo];
    [tableView setEditing:YES animated:YES];
    [tableView reloadData];
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除收藏";
}
@end
