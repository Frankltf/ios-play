//
//  XMGFastLogin.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGFastLogin.h"

@implementation XMGFastLogin

+(instancetype)addnib{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
}

@end
