//
//  FTCollectionVideoCell.m
//  FootNews
//
//  Created by mac on 16/3/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTCollectionVideoCell.h"
#import "FTFootBallNews.h"
#import "FTDataTool.h"
#import <UIImageView+WebCache.h>


@interface FTCollectionVideoCell()
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;
@property (weak, nonatomic) IBOutlet UILabel *videoTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation FTCollectionVideoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];

}


- (void)setNews:(FTFootBallNews *)news
{
    _news = news;
    
    [self.videoImageView sd_setImageWithURL:[NSURL URLWithString:news.imglink] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    self.timeLabel.text = news.duration;
    self.videoTitleLabel.text = news.title;
    
}
- (IBAction)playVideo:(id)sender {
    
}
- (IBAction)deleteColletion:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(collectionVideoCell:didSelectRomoveNewsVideo:)]) {
        [self.delegate collectionVideoCell:self didSelectRomoveNewsVideo:self.news];
    }
    
    
}
@end
