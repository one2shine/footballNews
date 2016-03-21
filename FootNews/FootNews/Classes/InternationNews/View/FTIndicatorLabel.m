//
//  FTIndicatorLabel.m
//  football
//
//  Created by mac on 16/3/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTIndicatorLabel.h"
#import "const.h"

@implementation FTIndicatorLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.textColor = [UIColor lightGrayColor];
        
        self.textAlignment = NSTextAlignmentCenter;
        //        label.backgroundColor = FTRandomColor;
        self.userInteractionEnabled = YES;
        self.font = [UIFont systemFontOfSize:14];
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    if (selected) {
        self.font = [UIFont fontWithName:@"FZLTZCHJW" size:16];;
        self.textColor = FTMainGreenColor;
    } else {
        self.textColor = [UIColor lightGrayColor];
        
        self.font = [UIFont systemFontOfSize:14];
    }
}

@end
