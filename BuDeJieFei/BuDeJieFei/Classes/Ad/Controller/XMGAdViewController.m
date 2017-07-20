//
//  XMGAdViewController.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGAdViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <HP_MJExtension/MJExtension.h>
#import <UIImageView+WebCache.h>
#import "XMGAdItem.h"
#import "XMGTabController.h"

#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface XMGAdViewController ()
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (nonatomic,weak)UIImageView *adView;
@property (nonatomic,strong)XMGAdItem *item;
@end


@implementation XMGAdViewController


-(UIImageView *)adView{
    if(_adView == nil){
        UIImageView *image=[[UIImageView alloc]init];
        [self.containView addSubview:image];
        _adView=image;
    }
    return _adView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self lanuchimage];
    [self loadData];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)skip:(UIButton *)sender {
    XMGTabController *tabbar=[[XMGTabController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController=tabbar;
}
-(void)lanuchimage{
    if(iphone6p){
        self.imageview.image=[UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }else if(iphone6){
        self.imageview.image=[UIImage imageNamed:@"LaunchImage-800-667h"];
    }else if(iphone5){
        self.imageview.image=[UIImage imageNamed:@"LaunchImage-568h"];
    }else if(iphone4){
        self.imageview.image=[UIImage imageNamed:@"LaunchImage-700"];
    }
}
-(void)loadData{
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    // 3.发送请求
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        _item=[XMGAdItem mj_objectWithKeyValues:adDict];
        self.adView.frame=CGRectMake(0, 0, XMGScreenW, _item.h);
        [self.adView sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
