//
//  XMGLoginController.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGLoginController.h"
#import "XMGFastLogin.h"
@interface XMGLoginController ()
@property (weak, nonatomic) IBOutlet UIView *fastLogin;

@end

@implementation XMGLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFastView];

}

- (IBAction)popLogin:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)addFastView{
    XMGFastLogin *fastLogin=[XMGFastLogin addnib];
    [self.fastLogin addSubview:fastLogin];
}

@end
