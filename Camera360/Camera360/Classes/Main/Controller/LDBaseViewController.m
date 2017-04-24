//
//  LDBaseViewController.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDBaseViewController.h"

@interface LDBaseViewController ()

@end

@implementation LDBaseViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
}

// 类的Public方法
#pragma mark - Public methods

// 所有的Actions
#pragma mark - Actions


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
