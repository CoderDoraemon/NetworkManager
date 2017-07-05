//
//  CaculateMake.h
//  test01
//
//  Created by 文刂Rn on 2017/6/14.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CaculateMake : NSObject

/** 结果 */
@property (nonatomic, assign) CGFloat result;

- (CaculateMake *(^)(CGFloat))add;

- (CaculateMake *(^)(CGFloat))sub;

@end
