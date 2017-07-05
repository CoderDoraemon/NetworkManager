//
//  CaculateMake.m
//  test01
//
//  Created by 文刂Rn on 2017/6/14.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "CaculateMake.h"

@implementation CaculateMake

- (CaculateMake *(^)(CGFloat))add {
    __weak typeof(self) weakSelf = self;
    return ^CaculateMake *(CGFloat value) {
        weakSelf.result += value;
        return weakSelf;
    };
}

- (CaculateMake *(^)(CGFloat))sub {
    __weak typeof(self) weakSelf = self;
    return ^CaculateMake *(CGFloat value) {
        weakSelf.result -= value;
        return weakSelf;
    };
}

@end
