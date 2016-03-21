//
//  FTCollectionVideoCell.h
//  FootNews
//
//  Created by mac on 16/3/16.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FTFootBallNews;
@class FTCollectionVideoCell;

@protocol FTCollectionVideoCellDelegate <NSObject>

@optional
- (void)collectionVideoCell:(FTCollectionVideoCell *)collectionVideoCell didSelectRomoveNewsVideo:(FTFootBallNews *)newsVideo;

@end
@interface FTCollectionVideoCell : UITableViewCell
@property (nonatomic, strong) FTFootBallNews *news;
@property (nonatomic, weak) id<FTCollectionVideoCellDelegate> delegate;

@end
