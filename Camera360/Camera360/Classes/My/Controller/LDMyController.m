//
//  LDMyController.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDMyController.h"
#import "Caculate.h"

@interface LDMyController ()

@end

@implementation LDMyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setup];
    
    
    CGFloat result = [Caculate caculate:^(CaculateMake *make) {
        make.add(10).add(200);
    }];
    
    NSLog(@"result=====%f", result);
}


- (void)setup {
    [self setNavgation];
}

- (void)setNavgation {
    self.navigationItem.title = @"我的";
}

@end
