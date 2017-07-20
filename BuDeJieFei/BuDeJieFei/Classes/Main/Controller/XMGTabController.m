//
//  XMGTabController.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGTabController.h"
#import "XMGEssenceViewController.h"
#import "XMGNewViewController.h"
#import "XMGPublishViewController.h"
#import "XMGFriendTrendViewController.h"
#import "XMGMyTableViewController.h"
@interface XMGTabController ()

@end

@implementation XMGTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildViewController];
    [self setupButtonNndTitle];
    // Do any additional setup after loading the view.
}

-(void)setupAllChildViewController{
    //精华
    XMGEssenceViewController *essence=[[XMGEssenceViewController alloc]init];
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:essence];
    [self addChildViewController:nav1];
    
    //新帖
    XMGNewViewController *new=[[XMGNewViewController alloc]init];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:new];
    [self addChildViewController:nav2];
    
    
    //发布
    XMGPublishViewController *publish=[[XMGPublishViewController alloc]init];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:publish];
    [self addChildViewController:nav3];
    
    
    //关注
    XMGFriendTrendViewController *friendTrend=[[XMGFriendTrendViewController alloc]init];
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:friendTrend];
    [self addChildViewController:nav4];
    
    
    //我的
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:NSStringFromClass([XMGMyTableViewController class]) bundle:nil];
    XMGMyTableViewController *my=[storyboard instantiateInitialViewController];
    UINavigationController *nav5=[[UINavigationController alloc]initWithRootViewController:my];
    [self addChildViewController:nav5];
    
}
-(void)setupButtonNndTitle{
    UINavigationController *nav1=self.childViewControllers[0];
    nav1.tabBarItem.title=@"精华";
    nav1.tabBarItem.image=[UIImage imageNamed:@"tabBar_essence_icon"];
    nav1.tabBarItem.selectedImage=[UIImage imageNamed:@"tabBar_essence_click_icon"];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [nav1.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体尺寸:只有设置正常状态下,才会有效果
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [nav1.tabBarItem setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
    
    UINavigationController *nav2=self.childViewControllers[1];
    nav2.tabBarItem.title=@"新帖";
    nav2.tabBarItem.image=[UIImage imageNamed:@"tabBar_new_icon"];
    nav2.tabBarItem.selectedImage=[UIImage imageNamed:@"tabBar_new_click_icon"];
    
    NSMutableDictionary *attrs4 = [NSMutableDictionary dictionary];
    attrs4[NSForegroundColorAttributeName] = [UIColor blackColor];
    [nav2.tabBarItem setTitleTextAttributes:attrs4 forState:UIControlStateSelected];
    
    // 设置字体尺寸:只有设置正常状态下,才会有效果
    NSMutableDictionary *attrsNor4 = [NSMutableDictionary dictionary];
    attrsNor4[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [nav2.tabBarItem setTitleTextAttributes:attrsNor4 forState:UIControlStateNormal];
    
    UINavigationController *nav3=self.childViewControllers[2];
    nav3.tabBarItem.image=[UIImage imageNamed:@"tabBar_publish_icon"];
    nav3.tabBarItem.selectedImage=[UIImage imageNamed:@"tabBar_publish_click_icon"];
    
    NSMutableDictionary *attrs1 = [NSMutableDictionary dictionary];
    attrs1[NSForegroundColorAttributeName] = [UIColor blackColor];
    [nav3.tabBarItem setTitleTextAttributes:attrs1 forState:UIControlStateSelected];
    
    // 设置字体尺寸:只有设置正常状态下,才会有效果
    NSMutableDictionary *attrsNor1 = [NSMutableDictionary dictionary];
    attrsNor1[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [nav3.tabBarItem setTitleTextAttributes:attrsNor1 forState:UIControlStateNormal];
    
    UINavigationController *nav4=self.childViewControllers[3];
    nav4.tabBarItem.title=@"关注";
    nav4.tabBarItem.image=[UIImage imageNamed:@"tabBar_friendTrends_icon"];
    nav4.tabBarItem.selectedImage=[UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
    
    NSMutableDictionary *attrs2 = [NSMutableDictionary dictionary];
    attrs2[NSForegroundColorAttributeName] = [UIColor blackColor];
    [nav4.tabBarItem setTitleTextAttributes:attrs2 forState:UIControlStateSelected];
    
    // 设置字体尺寸:只有设置正常状态下,才会有效果
    NSMutableDictionary *attrsNor2 = [NSMutableDictionary dictionary];
    attrsNor2[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [nav4.tabBarItem setTitleTextAttributes:attrsNor2 forState:UIControlStateNormal];
    
    UINavigationController *nav5=self.childViewControllers[4];
    nav5.tabBarItem.title=@"我的";
    nav5.tabBarItem.image=[UIImage imageNamed:@"tabBar_me_icon"];
    nav5.tabBarItem.selectedImage=[UIImage imageNamed:@"tabBar_me_click_icon"];
    NSMutableDictionary *attrs3 = [NSMutableDictionary dictionary];
    attrs3[NSForegroundColorAttributeName] = [UIColor blackColor];
    [nav5.tabBarItem setTitleTextAttributes:attrs3 forState:UIControlStateSelected];
    // 设置字体尺寸:只有设置正常状态下,才会有效果
    NSMutableDictionary *attrsNor3 = [NSMutableDictionary dictionary];
    attrsNor3[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [nav5.tabBarItem setTitleTextAttributes:attrsNor3 forState:UIControlStateNormal];
}
@end
