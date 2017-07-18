//
//  UIBarButtonItem+Item.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(nullable id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containview=[[UIView alloc]initWithFrame:btn.bounds];
    [containview addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:containview];
}
+(UIBarButtonItem *)itemWithImageSelected:(UIImage *)image highImage:(UIImage *)highImage target:(nullable id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *containview=[[UIView alloc]initWithFrame:btn.bounds];
    [containview addSubview:btn];
    return [[UIBarButtonItem alloc]initWithCustomView:containview];
}
@end
