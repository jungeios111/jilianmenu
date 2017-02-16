//
//  ViewController.m
//  级联菜单（2个tableView，1个控制器）
//
//  Created by ZKJ on 2016/11/23.
//  Copyright © 2016年 ZKJ. All rights reserved.
//

#import "ViewController.h"
#import "ZKJCategory.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *categoryTableView;
@property (strong, nonatomic) IBOutlet UITableView *subCategoryTableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (NSArray *)dataArray
{
    if (!_dataArray) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories.plist" ofType:nil]];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            [tempArray addObject:[ZKJCategory categoryWithDic:dic]];
        }
        _dataArray = tempArray;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 默认选中左边第0行
    [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    self.subCategoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"categoryTableView:%@",NSStringFromUIEdgeInsets(self.categoryTableView.contentInset));
    NSLog(@"subCategoryTableView:%@",NSStringFromUIEdgeInsets(self.subCategoryTableView.contentInset));
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
    
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.categoryTableView) {
        return self.dataArray.count;
    } else {
        ZKJCategory *cate = self.dataArray[self.categoryTableView.indexPathForSelectedRow.row];
        return cate.subcategories.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        static NSString *cellName = @"cateCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        ZKJCategory *cate = self.dataArray[indexPath.row];
        cell.textLabel.text = cate.name;
        cell.textLabel.highlightedTextColor = [UIColor redColor];
        cell.imageView.image = [UIImage imageNamed:cate.icon];
        cell.imageView.highlightedImage = [UIImage imageNamed:cate.highlighted_icon];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    } else {
        static NSString *cellName = @"subCateCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        ZKJCategory *cate = self.dataArray[self.categoryTableView.indexPathForSelectedRow.row];
        cell.textLabel.text = cate.subcategories[indexPath.row];
        cell.textLabel.highlightedTextColor = [UIColor redColor];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) {
        [self.subCategoryTableView reloadData];
    }
}


@end
