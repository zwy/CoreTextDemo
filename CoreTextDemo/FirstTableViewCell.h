//
//  FirstTableViewCell.h
//  CoreTextDemo
//
//  Created by zwy on 15/1/28.
//  Copyright (c) 2015年 zwy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreTextData.h"
#import "CTDisplayView.h"
@interface FirstTableViewCell : UITableViewCell
@property (strong, nonatomic)  CoreTextData *data;
@property (strong, nonatomic) IBOutlet CTDisplayView *ctView;

- (void)updateCellWithData:(CoreTextData *)data;

@end
