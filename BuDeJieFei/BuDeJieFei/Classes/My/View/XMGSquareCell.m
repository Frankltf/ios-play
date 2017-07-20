//
//  XMGSquareCell.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/20.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSquareCell.h"
#import "XMGCollectionItem.h"

@interface XMGSquareCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *title;
@end

@implementation XMGSquareCell
-(void)setItem:(XMGCollectionItem *)item{
    _item=item;
    _title.text=item.name;
    [self.imageview xmg_setheader:item.icon];
}
@end
