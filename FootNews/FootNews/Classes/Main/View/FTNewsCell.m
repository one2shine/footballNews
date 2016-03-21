//
//  FTNewsCell.m
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTNewsCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "FTFootBallNews.h"

@interface FTNewsCell()

@property (weak, nonatomic) IBOutlet UIImageView *ImgLinkView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@end

@implementation FTNewsCell





- (void)setFootballNews:(FTFootBallNews *)footballNews
{
    
    _footballNews = footballNews;
    
    [self.ImgLinkView sd_setImageWithURL:[NSURL URLWithString:footballNews.imglink] placeholderImage:[UIImage imageNamed:@"placeHolder"]];

    self.titleLabel.text = footballNews.title;
    self.contentLabel.text = footballNews.content168;
    self.authorLabel.text = footballNews.author;
    
}
- (void)awakeFromNib {
    

    self.ImgLinkView.contentScaleFactor = [[UIScreen mainScreen] scale];
    self.ImgLinkView.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    
}

@end
