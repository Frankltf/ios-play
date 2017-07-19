//
//  XMGNewViewController.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGNewViewController.h"
#import "UIBarButtonItem+Item.h"
#import "XMGSubTagTableViewController.h"
@interface XMGNewViewController ()

@end

@implementation XMGNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    // Do any additional setup after loading the view.
}

-(void)setupNavBar{
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(oneClick)];
    self.navigationItem.title=@"新帖";
}
-(void)oneClick{
    XMGSubTagTableViewController *subtag=[[XMGSubTagTableViewController alloc]init];
    [self.navigationController pushViewController:subtag animated:YES];
}
@end
