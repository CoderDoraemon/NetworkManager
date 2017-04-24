//
//  LDLaunchViewManager.h
//  Camera360
//
//  Created by 文刂Rn on 2017/3/8.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDAdModel.h"

@interface LDLaunchViewManager : UIView

/** 广告模型*/
@property (nonatomic , strong) LDAdModel  *adModel;

+ (instancetype)launchViewManger;

- (void)showView:(UIView *)view;

@end
