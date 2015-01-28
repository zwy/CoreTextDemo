//
//  FirstTableViewCell.m
//  CoreTextDemo
//
//  Created by zwy on 15/1/28.
//  Copyright (c) 2015年 zwy. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithData:(CoreTextData *)data
{
    if (data != self.data) {
        self.data = data;
        
        if (self.ctView) {
            [self.ctView removeFromSuperview];
            self.ctView = nil;
        }
        self.ctView = [[CTDisplayView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, 0)];;
        self.ctView.data = data;
        self.ctView.height = data.height;
        [self.contentView addSubview:self.ctView];
        self.ctView.backgroundColor = [UIColor clearColor];
        [self.ctView reloadView];
    }
}

@end
