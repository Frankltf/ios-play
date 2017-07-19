//
//  XMGFriendTrendViewController.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGFriendTrendViewController.h"
#import "XMGLoginController.h"
@interface XMGFriendTrendViewController ()

@end

@implementation XMGFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    // Do any additional setup after loading the view.
}
-(void)setupNavBar{
    self.navigationItem.title=@"关注";
}
- (IBAction)loginBtn:(UIButton *)sender {
    XMGLoginController *login=[[XMGLoginController alloc]init];
    [self presentViewController:login animated:YES completion:nil];
}

@end
