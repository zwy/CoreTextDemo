//
//  FirstTableViewController.m
//  CoreTextDemo
//
//  Created by zwy on 15/1/28.
//  Copyright (c) 2015年 zwy. All rights reserved.
//

#import "FirstTableViewController.h"
#import "CTFrameParserConfig.h"
#import "CTFrameParser.h"
#import "CTDisplayView.h"
#import "FirstTableViewCell.h"
#import "CoreTextLinkData.h"
@interface FirstTableViewController ()
@property (nonatomic, retain)NSArray *dataArray;
@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self createNav];
    [self createTableView];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化 navigationController
- (void)createNav
{
    self.title = @"列表";
}

// 创建tableview
- (void)createTableView
{
    [self createTableViewData];
}

// 初始化tableview数据
- (void)createTableViewData
{
    //1
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
//    config.textColor = [UIColor redColor];
    config.width = kScreenWidth - 20;
    CoreTextData *data = [CTFrameParser parseContent:@"恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠恩惠123" config:config];
    //2
    CoreTextData *data2 = [CTFrameParser parseContent:@"动态cell" config:config];
    //3
    NSString *content3 = @"恩惠恩惠恩惠恩惠恩,惠恩惠恩惠恩惠.\n恩惠恩惠恩惠恩惠恩惠\n\n恩惠恩惠恩惠恩惠恩惠123";
    NSDictionary *dic3 = [CTFrameParser attributesWithConfig:config];
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:content3 attributes:dic3];
    // TODO 不管用
    [attributedString3 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    CoreTextData *data3 = [CTFrameParser parseAttributedContent:attributedString3 config:config];
    
    // 4 json
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"json"];
    CoreTextData *data4 = [CTFrameParser parseTemplateFile:path config:config];
    
    // 5 本地数组
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys: @"blue", @"color", @"链接文字",@"content" ,  @"http://www.changlianxi.com",@"url" , @"link", @"type" , nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys: @"img",@"type" , @300,@"width" ,  @160, @"height" , @"coretext-image-1.jpg",@"name" , nil];
    NSArray *contentArray = [[NSArray alloc]initWithObjects: dic1 , dic2 ,
                              nil];
    
  
    CoreTextData *data5 = [CTFrameParser parseContentArray:contentArray config:config];
    
    self.dataArray = @[data,data2,data3,data4,data5,data4,data3,data2,data,data5];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    CoreTextData *data = [self.dataArray objectAtIndex:indexPath.row];
    [cell updateCellWithData:data];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoreTextData *data = [self.dataArray objectAtIndex:indexPath.row];
    return data.height;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)imagePressed:(NSNotification*)notification {
    NSDictionary *userInfo = [notification userInfo];
    CoreTextImageData *imageData = userInfo[@"imageData"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"点击图片:%@",imageData.name ] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
}

- (void)linkPressed:(NSNotification*)notification {
    NSDictionary *userInfo = [notification userInfo];
    CoreTextLinkData *linkData = userInfo[@"linkData"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"点击链接:%@",linkData.title ] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
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
