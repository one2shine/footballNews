//
//  FTNewsCell.h
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FTFootBallNews;

@interface FTNewsCell : UITableViewCell

@property (nonatomic, strong) FTFootBallNews *footballNews;
//+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
