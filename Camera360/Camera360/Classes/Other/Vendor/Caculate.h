//
//  Caculate.h
//  test01
//
//  Created by 文刂Rn on 2017/6/14.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CaculateMake.h"

@interface Caculate : NSObject

+ (CGFloat)caculate:(void(^)(CaculateMake *make))caculateBlock;

@end
