//
//  SJXBaseTabBarController.m
//  SimulateHttpRequestDataDemo
//
//  Created by sjx on 2017/4/7.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import "SJXBaseTabBarController.h"
#import "SJXBaseNavigationController.h"
#import "SJXTestOneViewController.h"
#import "SJXTestTwoViewController.h"

@interface SJXBaseTabBarController ()

@end

@implementation SJXBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVCs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <创建所有子控制器>
- (void)setupChildVCs {
    [self setupChildVC:[[SJXTestOneViewController alloc] init] title:@"测试一"];
    [self setupChildVC:[[SJXTestTwoViewController alloc] init] title:@"测试二"];
}

#pragma mark - <创建单个子控制器>
- (void)setupChildVC:(UIViewController *)vc title:(NSString *)title {
    SJXBaseNavigationController *nav = [[SJXBaseNavigationController alloc] initWithRootViewController:vc];
    vc.title = title;
    [self addChildViewController:nav];
}

@end
