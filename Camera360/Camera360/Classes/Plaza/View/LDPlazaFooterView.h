//
//  LDPlazaFooterView.h
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LDPlazaFooterView;

@protocol LDPlazaFooterViewDelegate <NSObject>

@optional
- (void)plazaFooterViewReloadData:(LDPlazaFooterView *)view;

@end

@interface LDPlazaFooterView : UIView

/** delegate */
@property (nonatomic, weak) id<LDPlazaFooterViewDelegate> delegate;

/** 数据源 */
@property (nonatomic, strong) NSArray *dataArray;

@end
