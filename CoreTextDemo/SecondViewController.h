//
//  SecondViewController.h
//  CoreTextDemo
//
//  Created by zwy on 15/1/28.
//  Copyright (c) 2015年 zwy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTDisplayView.h"
@interface SecondViewController : UIViewController

@property (strong, nonatomic)  CTDisplayView *ctView;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
