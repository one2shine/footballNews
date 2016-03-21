//
//  FTVideoViewCell.h
//  FootNews
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTFootBallNews.h"

@interface FTVideoViewCell : UITableViewCell

@property (nonatomic, strong) FTFootBallNews *news;

+ (instancetype)videoCellWithTabelView:(UITableView *)tableView;
@end
