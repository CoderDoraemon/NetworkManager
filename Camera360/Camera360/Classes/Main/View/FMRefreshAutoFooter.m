//
//  FMRefreshAutoFooter.m
//  FM
//
//  Created by FM on 2016/11/22.
//  Copyright © 2016年 FMSecret. All rights reserved.
//

#import "FMRefreshAutoFooter.h"

@implementation FMRefreshAutoFooter

- (void)prepare {
    [super prepare];
    
    [self setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
    [self setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    [self setTitle:@"没有更多啦~" forState:MJRefreshStateNoMoreData];
    
    self.stateLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    self.stateLabel.font = [UIFont systemFontOfSize:12 weight:1];
    
}

@end
