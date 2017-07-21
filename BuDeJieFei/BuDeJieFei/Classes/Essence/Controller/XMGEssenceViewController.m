//
//  XMGEssenceViewController.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGEssenceViewController.h"
#import "XMGAllTableViewController.h"
#import "XMGVideoTableViewController.h"
#import "XMGVoiceTableViewController.h"
#import "XMGPictureTableViewController.h"
#import "XMGWordTableViewController.h"

@interface XMGEssenceViewController () <UIScrollViewDelegate>
@property(nonatomic,weak)UIView *titleView;
@property (nonatomic,weak)UIScrollView *scrollveiw;
@end

@implementation XMGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildController];
    [self setupNavBar];
    [self setupScrollView];
    [self setupTitle];
    [self addChildViewIntoScrollView:0];
    // Do any additional setup after loading the view.
}
-(void)setupAllChildController{
    [self addChildViewController:[[XMGVoiceTableViewController alloc]init]];
    [self addChildViewController:[[XMGAllTableViewController alloc]init]];
    [self addChildViewController:[[XMGVideoTableViewController alloc]init]];
    [self addChildViewController:[[XMGPictureTableViewController alloc]init]];
    [self addChildViewController:[[XMGWordTableViewController alloc]init]];
}
-(void)setupNavBar{
    self.navigationItem.title=@"精华";
}
-(void)setupScrollView{
    UIScrollView *scrollview=[[UIScrollView alloc]init];
    scrollview.backgroundColor=[UIColor redColor];
    scrollview.frame=self.view.bounds;
    scrollview.delegate=self;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.showsVerticalScrollIndicator = NO;
    scrollview.pagingEnabled=YES;
    [self.view addSubview:scrollview];
    self.scrollveiw=scrollview;
    NSUInteger count=self.childViewControllers.count;
    CGFloat scrollviewW=scrollview.frame.size.width * count;
    scrollview.contentSize=CGSizeMake(scrollviewW, 0);
    
    
}
-(void)setupTitle{
    UIView *titleView=[[UIView alloc]init];
    titleView.backgroundColor=[UIColor blueColor];
    CGFloat navY=64;
    CGFloat navH=35;
    CGFloat navw=self.view.frame.size.width;
    titleView.frame=CGRectMake(0, navY, navw, navH);
    self.titleView=titleView;
    [self.view addSubview:titleView];
    
    [self setupTitleButtons];
}
-(void)setupTitleButtons{
    NSArray *arrTitle=@[@"声音",@"全部",@"视频",@"图片",@"段子"];
    NSUInteger count=arrTitle.count;
    CGFloat titleButtonW=self.titleView.frame.size.width/count;
    CGFloat titleButtonH=self.titleView.frame.size.height;
    for (NSUInteger i=0; i<count; i++) {
        UIButton *btn=[[UIButton alloc]init];
        btn.tag=i;
        [btn addTarget:self action:@selector(navBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:btn];
        btn.frame=CGRectMake(i*titleButtonW, 0, titleButtonW, titleButtonH);
        [btn setTitle:arrTitle[i] forState:UIControlStateNormal];
    }
}
-(void)navBtn:(UIButton *)btn{
    NSUInteger index=btn.tag;
    [UIView animateWithDuration:0.25 animations:^{
        CGFloat floatX=self.scrollveiw.frame.size.width * index;
        self.scrollveiw.contentOffset=CGPointMake(floatX, self.scrollveiw.contentOffset.y);
    } completion:^(BOOL finished) {
        [self addChildViewIntoScrollView:index];
    }];
}
-(void)addChildViewIntoScrollView:(NSUInteger)index{
    UIViewController *childvc=self.childViewControllers[index];
    if(childvc.isViewLoaded){
        return;
    };
    UIView *childvcView=childvc.view;
    childvcView.frame=CGRectMake(index * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.scrollveiw addSubview:childvcView];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"%d",4444);
    NSUInteger index=scrollView.contentOffset.x/scrollView.frame.size.width;
    UIButton *titlebutton=self.titleView.subviews[index];
    [self navBtn:titlebutton];
}




@end
