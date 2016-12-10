//
//  XPTableViewController.m
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import "XPTabbarViewController.h"
#import "XFHomeViewController.h"
#import "XFMineViewController.h"
#import "XFStoreViewController.h"
#import "XFSearchViewController.h"
#import "XFMessageViewController.h"
#import "BaseNavigationController.h"
@interface XPTabbarViewController () <UITabBarControllerDelegate>
@property (strong,nonatomic) NSMutableArray * tabList;
@end

@implementation XPTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self setupUI];
}
- (void)setupUI{
    XFHomeViewController * homeVC = [[XFHomeViewController alloc]init];
    XFMineViewController * mineVC = [[XFMineViewController alloc]init];
    XFStoreViewController * storeVC =[[ XFStoreViewController alloc]init];
    XFMessageViewController * msnVC = [[XFMessageViewController alloc]init];
    XFSearchViewController * searchVC = [[XFSearchViewController alloc]init];
    BaseNavigationController *nav =[[BaseNavigationController alloc]initWithRootViewController:homeVC];
    [self setupTabItem:@"首页" andIcon:@"tab_home_d" andSelectedIcon:@"tab_home" andVC:nav];
    [self setupTabItem:@"搜索" andIcon:@"tab_search_d" andSelectedIcon:@"tab_search" andVC:searchVC];
    [self setupTabItem:@"购物车" andIcon:@"tab_store_d" andSelectedIcon:@"tab_store" andVC:storeVC];
    [self setupTabItem:@"消息" andIcon:@"tab_msn_d" andSelectedIcon:@"tab_msn" andVC:msnVC];
    [self setupTabItem:@"我" andIcon:@"tab_me_d" andSelectedIcon:@"tab_me" andVC:mineVC];
    self.viewControllers = self.tabList;
}

- (void) setupTabItem:(NSString *) name andIcon:(NSString *) icon andSelectedIcon:(NSString *) selectedIcon andVC:(UIViewController *) vc {
    [vc.tabBarItem setTitle:name];
    [vc.tabBarItem setImage:[UIImage imageNamed:icon]];
    [vc.tabBarItem setSelectedImage:[UIImage imageNamed:selectedIcon]];
    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [vc.tabBarItem setTitleTextAttributes:[NSMutableDictionary dictionaryWithObject:[UIColor lightGrayColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:[NSMutableDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];

    [self.tabList addObject:vc];
}
- (NSMutableArray *)tabList
{
    if (!_tabList) {
        _tabList = [[NSMutableArray alloc]init];
    }
    return _tabList;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
