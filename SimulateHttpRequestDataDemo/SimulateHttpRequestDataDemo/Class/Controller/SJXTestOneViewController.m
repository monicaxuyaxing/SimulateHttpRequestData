//
//  SJXTestOneViewController.m
//  SimulateHttpRequestDataDemo
//
//  Created by sjx on 2017/4/7.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import "SJXTestOneViewController.h"

@interface SJXTestOneViewController ()<UITableViewDelegate, UITableViewDataSource>

/** 表格视图 */
@property(nonatomic, weak) UITableView *testOneTableView;

@end

@implementation SJXTestOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupTableView {
    self.testOneTableView.mj_header = [SJXRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(testOneRefreshHeaderBegin)];
    [self.testOneTableView.mj_header beginRefreshing];
}

- (void)testOneRefreshHeaderBegin {

    __weak typeof(self) weakSelf = self;
    [[SJXNetworkTool share] postWithURLString:@"http://myTestDemo/testOne" parameters:nil success:^(id responseObject) {
        SjxLog(@"%@", [responseObject sjx_jsonString]);
        [weakSelf.testOneTableView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        SjxLog(@"%@", error);
        [weakSelf.testOneTableView.mj_header endRefreshing];
    }];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

#pragma mark - <懒加载>
- (UITableView *)testOneTableView {
    if (!_testOneTableView) {
        UITableView *tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        tv.delegate = self;
        tv.dataSource = self;
        [self.view addSubview:tv];
        _testOneTableView = tv;
    }
    return _testOneTableView;
}

@end
