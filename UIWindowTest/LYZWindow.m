//
//  LYZWindow.m
//  UIWindowTest
//
//  Created by liyazhou on 2017/8/2.
//  Copyright © 2017年 liyazhou. All rights reserved.
//

#import "LYZWindow.h"

static LYZWindow *_instance;

@interface LYZWindow ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation LYZWindow

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    if (_instance == nil)
    {
        dispatch_once(&onceToken, ^{
            _instance = [[LYZWindow alloc] init];
        });
    }
    return _instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.rootViewController = [[UIViewController alloc] init];
        self.windowLevel = UIWindowLevelAlert + 1;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.userInteractionEnabled = NO;
        
        self.array = [[NSMutableArray alloc] init];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 280) style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self addSubview:tableView];
        self.tableView = tableView;
        
        self.frame = self.tableView.bounds;
        
        [self updateDataWithArray:nil];
    }
    return self;
}

- (void)updateDataWithArray:(NSMutableArray *)array
{
    if (array.count > 0)
    {
        self.array = array;
    }
    
    NSArray *arr = @[@"z这是测试的第一行z这是测试的第一行z这是测试的第一行z这是测试的第一行z这是测试的第一行z这是测试的第一行",@"这是第二行",@"这是测试的第三行这是测试的第三行这是测试的第三行",@"这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行",@"z这是测试的第一行z这是测试的第一行z这是测试的第一行z这是测试的第一行z这是测试的第一行z这是测试的第一行",@"这是第二行",@"这是测试的第三行这是测试的第三行这是测试的第三行",@"这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行这是第四行"];
    self.array = [NSMutableArray arrayWithArray:arr];
    [self.tableView reloadData];
}

#pragma mark --- UITableViewDataSource ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark --- UITableViewDelegate --- 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    //去除。。。
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

@end
