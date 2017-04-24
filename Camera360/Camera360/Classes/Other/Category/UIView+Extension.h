//
//  UIView+Extension.h
//  FMsecert
//
//  Created by Vincent_Guo on 15-3-16.
//  Copyright (c) 2015年 Fung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

/**
 *  UIView的尺寸
 */
@property (nonatomic,assign) CGSize size;

/**
 *  获取或者更改控件的宽度
 */
@property (nonatomic,assign) CGFloat w;

/**
 *  获取或者更改控件的高度
 */
@property (nonatomic,assign) CGFloat h;

/**
 *  获取或者更改控件的x坐标
 */
@property (nonatomic,assign) CGFloat x;

/**
 *  获取或者更改控件的y坐标
 */
@property (nonatomic,assign) CGFloat y;

/**
 *  获取或者更改控件的centerX坐标
 */
@property (nonatomic,assign) CGFloat center_X;

/**
 *  获取或者更改控件的centerY坐标
 */
@property (nonatomic,assign) CGFloat center_Y;

/**
 *  快速根据xib创建View
 */
+ (instancetype)ld_viewFromXib;

/**
 *  判断self和view是否重叠
 */
- (BOOL)ld_intersectsWithView:(UIView *)view;

/**
 *  将View显示到主窗口
 */
- (void)showViewOnMainWindow;


@end
