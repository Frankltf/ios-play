//
//  XMGSubTagsTableViewCell.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGSubTagsTableViewCell.h"
#import "XMGItem.h"
@interface XMGSubTagsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *toplabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomlabel;

@end

@implementation XMGSubTagsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setItem:(XMGItem *)item{
    NSLog(@"%d",111);
    NSLog(@"%@",item);
    _item=item;
    _toplabel.text=item.theme_name;
    _bottomlabel.text=item.sub_number;
    
    
    
}


@end
