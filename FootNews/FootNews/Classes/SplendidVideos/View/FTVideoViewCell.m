//
//  FTVideoViewCell.m
//  FootNews
//
//  Created by mac on 16/3/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTVideoViewCell.h"
#import "UIImageView+WebCache.h"
#import "const.h"
#import "FTDataTool.h"

@interface FTVideoViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *smallImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@property (weak, nonatomic) IBOutlet UIButton *collectionBtn;

- (IBAction)collectVideo:(id)sender;


@end

@implementation FTVideoViewCell
+ (instancetype)videoCellWithTabelView:(UITableView *)tableView
{
    static NSString *reuseIdentifier = @"videoCell";
    FTVideoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FTVideoCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setNews:(FTFootBallNews *)news
{
    _news = news;
    
    self.titleLabel.text = news.title;

    
    [self.smallImageView sd_setImageWithURL:[NSURL URLWithString:news.imglink]];
    
    self.durationLabel.text = news.duration;
    
    BOOL exists = [FTDataTool existNewsVideo:news];
    
    self.collectionBtn.selected = exists;
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
}
- (void)awakeFromNib {

    self.autoresizingMask = NO;
    self.smallImageView.clipsToBounds = YES;
    
    
    
}
- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 0;
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    [super setFrame:frame];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

- (IBAction)collectVideo:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    
    if (sender.selected) {
        [FTDataTool saveNewsVideo:self.news];
    } else {
        [FTDataTool removeNewsFromDatabase:self.news];
    }
    
}
@end
