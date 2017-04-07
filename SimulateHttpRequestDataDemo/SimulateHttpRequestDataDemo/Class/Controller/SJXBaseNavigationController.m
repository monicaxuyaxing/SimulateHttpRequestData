//
//  SJXBaseNavigationController.m
//  SimulateHttpRequestDataDemo
//
//  Created by sjx on 2017/4/7.
//  Copyright © 2017年 sjx. All rights reserved.
//

#import "SJXBaseNavigationController.h"

@interface SJXBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SJXBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavBar];
    
    [self setupPanGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNavBar {

    // 设置导航条颜色及文字
    self.navigationBar.barTintColor = [UIColor darkGrayColor];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    NSMutableDictionary *barAtt = [NSMutableDictionary dictionary];
    barAtt[NSForegroundColorAttributeName] = [UIColor blackColor];
    barAtt[NSFontAttributeName] = [UIFont systemFontOfSize:19.0];
    [bar setTitleTextAttributes:barAtt];
}

#pragma mark - <设置手势>
- (void)setupPanGesture
{
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count > 1;
}

#pragma mark - <统一返回跳转按钮>
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"< 返回" forState:UIControlStateNormal];
        [button sizeToFit];
        [button addTarget:self action:@selector(popVCBackClick) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popVCBackClick
{
    [self popViewControllerAnimated:YES];
}

@end
