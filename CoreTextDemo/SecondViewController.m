//
//  SecondViewController.m
//  CoreTextDemo
//
//  Created by zwy on 15/1/28.
//  Copyright (c) 2015年 zwy. All rights reserved.
//

#import "SecondViewController.h"
#import "CTFrameParserConfig.h"
#import "CoreTextData.h"
#import "CTFrameParser.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUserInterface];
    [self setupNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNotifications {
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imagePressed:)
//                                                 name:CTDisplayViewImagePressedNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(linkPressed:)
//                                                 name:CTDisplayViewLinkPressedNotification object:nil];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupUserInterface {
    self.ctView = [[CTDisplayView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, 0)];
    
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.width = kScreenWidth - 20;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"text" ofType:@"json"];
    CoreTextData *data = [CTFrameParser parseTemplateFile:path config:config];
    
    self.ctView.data = data;
    self.ctView.height = data.height;
    self.ctView.backgroundColor = [UIColor whiteColor];
    
    self.scrollView.contentSize = CGSizeMake(kScreenWidth, data.height);
    [self.scrollView addSubview:self.ctView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
