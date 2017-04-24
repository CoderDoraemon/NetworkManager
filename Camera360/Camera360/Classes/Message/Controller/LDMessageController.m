//
//  LDMessageController.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDMessageController.h"

@interface LDMessageController ()

@end

@implementation LDMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setup];
}


- (void)setup {
    [self setNavgation];
}

- (void)setNavgation {
    self.navigationItem.title = @"消息";
}

@end
