//
//  FTSettingViewController.m
//  FootNews
//
//  Created by mac on 16/3/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTSettingViewController.h"
#import "const.h"
#import "FTFileManager.h"
#import "const.h"
//#import "UMSocial.h"

@interface FTSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *cellTitles;
@end

@implementation FTSettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(btnClicked)];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.tableView.scrollEnabled = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.cellTitles = @[@"为我评分!",@"版本",@"清除缓存"];
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
#pragma mark - tableView dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"settingCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.cellTitles[indexPath.row];
    
    if (indexPath.row == 2) {
        
        CGFloat cacheSize = [FTFileManager getCacheDirectorySize] / 1000 / 1000;
        if (cacheSize <= 0.1) {
            cell.textLabel.text = @"暂无缓存";
        } else {
        
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
            label.text = [NSString stringWithFormat:@"%.1fM",cacheSize];
            label.textColor = FTMainGreenColor;
            label.textAlignment = NSTextAlignmentRight;
            cell.accessoryView = label;
        }
        
    } else if (indexPath.row == 1){
        NSString *version = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
        NSLog(@"%@",version);
        label.text = version;
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor lightGrayColor];
        cell.accessoryView = label;
        
    }else {
    
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {//跳转到itunes应用页
        
    
    } else if (indexPath.row ==2) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [FTFileManager clearCache];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            });
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
