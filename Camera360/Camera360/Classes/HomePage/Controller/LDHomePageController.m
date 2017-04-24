//
//  LDHomePageController.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDHomePageController.h"
#import "TYTitlePageTabBar.h"
#import "TYSlidePageScrollView.h"
#import "LDTestTableViewController.h"
#import "LDTestCollectionViewController.h"

#define kNavBarHeight 64

@interface LDHomePageController () <TYSlidePageScrollViewDataSource,TYSlidePageScrollViewDelegate>

@property (nonatomic, weak) TYSlidePageScrollView *slidePageScrollView;
@property (nonatomic ,strong) UIButton *selectBtn;

@end

@implementation LDHomePageController

// 内存相关
#pragma mark - Memory manager
- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)dealloc {
    
}

// 类生命周期相关的
#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar lt_reset];
}

- (void)setup {
    
    [self setNavgation];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(navBack)];
//    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self addSlidePageScrollView];
    
    [self addHeaderView];
    
    [self addTabPageMenu];
    
    [self addFooterView];
    
    [self addTableViewWithPage:0 itemNum:6];
    
    [self addTableViewWithPage:1 itemNum:12];
    
    [self addTableViewWithPage:2 itemNum:16];
    
    [self addTableViewWithPage:3 itemNum:8];
    
    [_slidePageScrollView reloadData];
}

- (void)setNavgation {
    self.navigationItem.title = @"首页";
}

// 类的Public方法
#pragma mark - Public methods

// 所有的Actions
#pragma mark - Actions
- (void)navBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addSlidePageScrollView
{
    TYSlidePageScrollView *slidePageScrollView = [[TYSlidePageScrollView alloc]initWithFrame:self.view.bounds];
    //CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-64)];
    slidePageScrollView.pageTabBarIsStopOnTop = YES;
    slidePageScrollView.pageTabBarStopOnTopHeight = kNavBarHeight;
    slidePageScrollView.parallaxHeaderEffect = YES;
    slidePageScrollView.dataSource = self;
    slidePageScrollView.delegate = self;
    [self.view addSubview:slidePageScrollView];
    _slidePageScrollView = slidePageScrollView;
}

- (void)addHeaderView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_slidePageScrollView.frame), 200)];
    imageView.image = [UIImage imageNamed:@"banner_bestie@2x.jpg"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    _slidePageScrollView.headerView = imageView;
}

- (void)addTabPageMenu
{
    TYTitlePageTabBar *titlePageTabBar = [[TYTitlePageTabBar alloc]initWithTitleArray:@[@"视频",@"图片",@"段子",@"网红"]];
    titlePageTabBar.frame = CGRectMake(0, 0, CGRectGetWidth(_slidePageScrollView.frame), 40);
    titlePageTabBar.backgroundColor = [UIColor whiteColor];
    _slidePageScrollView.pageTabBar = titlePageTabBar;
}

- (void)addFooterView
{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_slidePageScrollView.frame), 40)];
    footerView.backgroundColor = [UIColor orangeColor];
    UILabel *lable = [[UILabel alloc]initWithFrame:footerView.bounds];
    lable.textColor = [UIColor whiteColor];
    lable.text = @"   footerView";
    [footerView addSubview:lable];
    _slidePageScrollView.footerView = footerView;
}

- (void)addTableViewWithPage:(NSInteger)page itemNum:(NSInteger)num
{
    LDTestTableViewController *tableViewVC = [[LDTestTableViewController alloc]init];
    tableViewVC.itemNum = num;
    tableViewVC.page = page;
    
    // don't forget set frame and addChildViewController
    tableViewVC.view.frame = self.view.frame;
    [self addChildViewController:tableViewVC];
}

#pragma mark - dataSource

- (NSInteger)numberOfPageViewOnSlidePageScrollView
{
    return self.childViewControllers.count;
}

- (UIScrollView *)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView pageVerticalScrollViewForIndex:(NSInteger)index
{
    LDTestTableViewController *tableViewVC = self.childViewControllers[index];
    return tableViewVC.tableView;
}

#pragma mark - delegate

- (void)slidePageScrollView:(TYSlidePageScrollView *)slidePageScrollView verticalScrollViewDidScroll:(UIScrollView *)pageScrollView
{
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    
    CGFloat headerContentViewHeight = -(CGRectGetHeight(slidePageScrollView.headerView.frame)+CGRectGetHeight(slidePageScrollView.pageTabBar.frame));
    // 获取当前偏移量
    CGFloat offsetY = pageScrollView.contentOffset.y;
    
    // 获取偏移量差值
    CGFloat delta = offsetY - headerContentViewHeight;
    
    CGFloat alpha = delta / (CGRectGetHeight(slidePageScrollView.headerView.frame) - kNavBarHeight);
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
}


// 通知回调，具体可以细分
#pragma mark - Notifications - XXX

// 系统的Delegate
#pragma mark - UITableViewDelegate

// 自定义类的Delegate
#pragma mark - XXXDelegate

// 自定义View、初始化等
#pragma mark - Custom views

// 类私有方法
#pragma mark - Private methods

@end
