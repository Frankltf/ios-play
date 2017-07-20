//
//  XMGMyTableViewController.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGMyTableViewController.h"
#import "UIBarButtonItem+Item.h"
@interface XMGMyTableViewController ()

@end

@implementation XMGMyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)setupNavBar{
    UIBarButtonItem *setting=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(oneClick)];
    UIBarButtonItem *nightItem=[UIBarButtonItem itemWithImageSelected:[UIImage imageNamed:@"mine-moon-icon"] highImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(twoClick:)];
    
    self.navigationItem.rightBarButtonItems=@[setting,nightItem];
    self.navigationItem.title=@"我的";
}
-(void)twoClick:(UIButton *)button{
    button.selected=!button.selected;
    NSLog(@"%d",555);
}
-(void)oneClick{
    NSLog(@"%d",4444);
}



@end
