//
//  LDPlazaController.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDPlazaController.h"
#import "LDPlazaCell.h"
#import "LDPlazaItemModel.h"
#import "LDPlazaHeaderView.h"
#import "LDPlazaFooterView.h"

@interface LDPlazaController () <UITableViewDataSource, UITableViewDelegate, LDPlazaFooterViewDelegate>

/** tableView */
@property (nonatomic, strong) UITableView *tableView;

/** headerView */
@property (nonatomic, strong) LDPlazaHeaderView *headerView;

/** footerView */
@property (nonatomic, strong) LDPlazaFooterView *footerView;

/** 数据源 */
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation LDPlazaController

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.tableView.frame = self.view.bounds;
}

- (void)setup {
    [self setNavgation];
    [self setView];
}

- (void)setNavgation {
    self.navigationItem.title = @"广场";
}

// 类的Public方法
#pragma mark - Public methods

// 所有的Actions
#pragma mark - Actions


#pragma mark - 通知回调，具体可以细分
#pragma mark Notifications - XXX

#pragma mark - 系统数据源方法
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.dataArray.count) {
        return 1;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LDPlazaCell *cell = [tableView dequeueReusableCellWithIdentifier:LDPlazaCellIdentifier forIndexPath:indexPath];
    
    
    return cell;
    
}

#pragma mark - 系统的Delegate
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - 自定义类的Delegate
#pragma mark LDPlazaFooterViewDelegate
- (void)plazaFooterViewReloadData:(LDPlazaFooterView *)view {
    
    [self.tableView reloadData];
}

#pragma mark - 自定义View、初始化等
#pragma mark Custom views
- (void)setView {
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LDPlazaCell class]) bundle:nil] forCellReuseIdentifier:LDPlazaCellIdentifier];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNetworkData];
    }];
    
    
    self.tableView.tableFooterView = self.footerView;
    
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)loadNetworkData {
    
    __weak typeof(self) weakSelf = self;
    [self.tableView.mj_footer resetNoMoreData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
            NSString *path = [[NSBundle mainBundle] pathForResource:@"layout.plist" ofType:nil];
            
            self.dataArray = [LDPlazaItemModel mj_objectArrayWithFile:path];
            
            dispatch_async(dispatch_get_main_queue(), ^{
               
                if (self.tableView.mj_header.isRefreshing) {
                    [self.tableView.mj_header endRefreshing];
                    
                }
                
                self.tableView.tableHeaderView = self.headerView;
                
                self.footerView.dataArray = self.dataArray;
                
                self.tableView.mj_footer = [FMRefreshAutoFooter footerWithRefreshingBlock:^{
                    [weakSelf loadMoreNetworkData];
                }];
                
            });
            
        });
        
    });
    
    
    
}

- (void)loadMoreNetworkData {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            NSString *path = [[NSBundle mainBundle] pathForResource:@"layout.plist" ofType:nil];
            
            NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.dataArray];
            
            [tempArray addObjectsFromArray:[LDPlazaItemModel mj_objectArrayWithFile:path]];
            
            self.dataArray = tempArray;
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (self.tableView.mj_footer.isRefreshing) {
                    [self.tableView.mj_footer endRefreshing];
                    
                }
                
                self.footerView.dataArray = self.dataArray;
                
                if (self.dataArray.count >= 1000) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                
            });
            
        });
        
    });
    
}

#pragma mark - Private methods
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return _tableView;
}

- (LDPlazaHeaderView *)headerView {
    if (_headerView == nil) {
        _headerView = [LDPlazaHeaderView plazaHeaderView];
        _headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250);
    }
    return _headerView;
}

- (LDPlazaFooterView *)footerView {
    if (_footerView == nil) {
        _footerView = [[LDPlazaFooterView alloc] init];
        _footerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0);
        _footerView.delegate = self;
    }
    return _footerView;
}

@end
