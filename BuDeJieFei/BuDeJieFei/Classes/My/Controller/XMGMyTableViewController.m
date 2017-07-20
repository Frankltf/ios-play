//
//  XMGMyTableViewController.m
//  BuDeJieFei
//
//  Created by admin on 2017/7/18.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "XMGMyTableViewController.h"
#import "UIBarButtonItem+Item.h"
#import <AFNetworking/AFNetworking.h>
#import <HP_MJExtension/MJExtension.h>
#import "XMGCollectionItem.h"
#import "XMGSquareCell.h"
static NSString * const ID=@"cell";
static NSInteger const cols=4;
static CGFloat const margin=1;
#define itemH (XMGScreenW-(cols-1)*margin)/cols




@interface XMGMyTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray *squareItems;
@property(nonatomic,weak)UICollectionView *collectionview;
@end

@implementation XMGMyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self setupFootView];
    [self loadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)setupNavBar{
    UIBarButtonItem *setting=[UIBarButtonItem itemWithImage:[UIImage imageNamed:@"MainTagSubIcon"] highImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(oneClick)];
    UIBarButtonItem *nightItem=[UIBarButtonItem itemWithImageSelected:[UIImage imageNamed:@"mine-moon-icon"] highImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(twoClick:)];
    
    self.navigationItem.rightBarButtonItems=@[setting,nightItem];
    self.navigationItem.title=@"我的";
}
-(void)twoClick:(UIButton *)button{
    button.selected=!button.selected;
    NSLog(@"%d",555);
}
-(void)oneClick{
    NSLog(@"%d",4444);
}
-(void)loadData{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 2.拼接请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    [mgr GET:XMGCommonURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        NSArray *dirarray=responseObject[@"square_list"];
        _squareItems=[XMGCollectionItem mj_objectArrayWithKeyValuesArray:dirarray];
        NSInteger count=-_squareItems.count;
        NSInteger rows=(count-1)/cols+1;
        CGRect rect=self.collectionview.frame;
        rect.size.height=rows*itemH;
        self.collectionview.frame=rect;
        self.tableView.tableFooterView=self.collectionview;
        [self.collectionview reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
-(void)setupFootView{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.itemSize=CGSizeMake(itemH, itemH);
    layout.minimumInteritemSpacing=margin;
    layout.minimumLineSpacing=margin;
    
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
    _collectionview=collectionView;
    collectionView.backgroundColor=self.tableView.backgroundColor;
    self.tableView.tableFooterView=collectionView;
    collectionView.dataSource=self;
    collectionView.delegate=self;
    collectionView.scrollEnabled=NO;
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XMGSquareCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.squareItems.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XMGSquareCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.item=self.squareItems[indexPath.row];
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}

@end
