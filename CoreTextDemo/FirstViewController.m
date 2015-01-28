//
//  FirstViewController.m
//  CoreTextDemo
//
//  Created by zwy on 15/1/28.
//  Copyright (c) 2015年 zwy. All rights reserved.
//

#import "FirstViewController.h"
#import "CTFrameParserConfig.h"
#import "CTFrameParser.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
//    config.textColor = [UIColor blackColor];
//    config.width = self.ctView.width;
//    CoreTextData *data = [CTFrameParser parseContent:@"恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠123" config:config];
//    
//
//    self.ctView.data = data;
//    self.ctView.height = data.height;
//    self.ctView.backgroundColor = [UIColor yellowColor];
    [self setupUserInterface];
    [self setupNotifications];
}

- (void)setupNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imagePressed:)
                                                 name:CTDisplayViewImagePressedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(linkPressed:)
                                                 name:CTDisplayViewLinkPressedNotification object:nil];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupUserInterface {
    self.ctView = [[CTDisplayView alloc] initWithFrame:CGRectMake(10, 64, kScreenWidth - 20, 0)];
    [self.view addSubview:self.ctView];
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    config.width = kScreenWidth - 20;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"json"];
    CoreTextData *data = [CTFrameParser parseTemplateFile:path config:config];
    
    self.ctView.data = data;
    self.ctView.height = data.height;
    self.ctView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePressed:(NSNotification*)notification {
    NSDictionary *userInfo = [notification userInfo];
    CoreTextImageData *imageData = userInfo[@"imageData"];
    
//    ImageViewController *vc = [[ImageViewController alloc] init];
//    vc.image = [UIImage imageNamed:imageData.name];
//    [self presentViewController:vc animated:YES completion:nil];
}

- (void)linkPressed:(NSNotification*)notification {
    NSDictionary *userInfo = [notification userInfo];
//    CoreTextLinkData *linkData = userInfo[@"linkData"];
//    
//    WebContentViewController *vc = [[WebContentViewController alloc] init];
//    vc.urlTitle = linkData.title;
//    vc.url = linkData.url;
//    [self presentViewController:vc animated:YES completion:nil];
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
