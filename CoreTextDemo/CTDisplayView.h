//
//  CTDisplayView.h
//  CoreTextDemo
//
//  Created by zwy on 15/1/28.
//  Copyright (c) 2015年 zwy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreTextData.h"
extern NSString *const CTDisplayViewImagePressedNotification;
extern NSString *const CTDisplayViewLinkPressedNotification;
@interface CTDisplayView : UIView

@property (strong, nonatomic) CoreTextData * data;

- (void)reloadView;

@end
