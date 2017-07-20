//
//  XMGSubTagTableViewController.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSubTagTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <HP_MJExtension/MJExtension.h>
#import "XMGItem.h"
#import "XMGSubTagsTableViewCell.h"
#import <SVProgressHUD/SVProgressHUD.h>



static NSString * const ID=@"cell";
@interface XMGSubTagTableViewController ()
@property (nonatomic,strong)NSArray *subtags;
@end

@implementation XMGSubTagTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self.tableView registerNib:[UINib nibWithNibName:@"XMGSubTagsTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
# pragma mark  - 请求数据
-(void)loadData{
    [SVProgressHUD showWithStatus:@"正在加载中。。。"];
    AFHTTPSessionManager *mgr=[AFHTTPSessionManager manager];
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    [mgr GET:XMGCommonURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _subtags=[XMGItem mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.subtags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XMGSubTagsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    XMGItem *item=self.subtags[indexPath.row];
    cell.item=item;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

@end
