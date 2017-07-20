//
//  UIImageView+XMGDownload.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIImageView+XMGDownload.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (XMGDownload)

-(void)xmg_setheader:(NSString *)url{
    UIImage *headerimage=[UIImage imageNamed:@"defaultUserIcon"];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:headerimage];
}
@end
