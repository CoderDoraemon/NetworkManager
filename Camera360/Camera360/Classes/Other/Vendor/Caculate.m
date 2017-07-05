//
//  Caculate.m
//  test01
//
//  Created by 文刂Rn on 2017/6/14.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "Caculate.h"

@implementation Caculate

+ (CGFloat)caculate:(void (^)(CaculateMake *))caculateBlock {
    
    CaculateMake *make = [[CaculateMake alloc] init];
    caculateBlock(make);
    return make.result;
}

@end
