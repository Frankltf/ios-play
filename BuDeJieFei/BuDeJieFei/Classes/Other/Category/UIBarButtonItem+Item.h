//
//  UIBarButtonItem+Item.h
//  BuDeJieFei
//
//  Created by admin on 2017/7/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Item)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(nullable id)target action:(SEL)action;
+(UIBarButtonItem *)itemWithImageSelected:(UIImage *)image highImage:(UIImage *)highImage target:(nullable id)target action:(SEL)action;
@end
