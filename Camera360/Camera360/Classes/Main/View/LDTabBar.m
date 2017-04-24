//
//  ZPHTabBar.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 ZPH. All rights reserved.
//

#import "LDTabBar.h"

@interface LDTabBar ()

/** 中间按钮 */
@property (nonatomic, strong) UIButton *postButton;

@end

@implementation LDTabBar

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.postButton];
        
    }
    return self;
}

//重新设置按钮的位置
-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = self.w;
    CGFloat height = self.h;
    NSInteger index = 0;
    CGFloat btnW = width / 5;
    CGFloat btnH = height;
    CGFloat btnY = 0;
    
    //发布按钮位置
    self.postButton.center_X = width / 2;
    self.postButton.y = -17;
    
    //遍历取出按钮
    for (UIView *view in self.subviews) {
        if (![view isKindOfClass:[UIControl class]] || view == self.postButton) continue; {
            
            CGFloat btnX = (index > 1 ? (index +1) : index) *btnW;
            
            view.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            index++;
        }
    }
    
}


#pragma mark - Action Mothods
- (void)postButtonClick {
    
}



#pragma mark - lazy
- (UIButton *)postButton {
    if (_postButton == nil) {
        _postButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_postButton setBackgroundImage:[UIImage imageNamed:@"tabBar_camera"] forState:UIControlStateNormal];
        [_postButton setBackgroundImage:[UIImage imageNamed:@"tabBar_camera"] forState:UIControlStateHighlighted];
        _postButton.size = _postButton.currentBackgroundImage.size;
        [_postButton addTarget:self action:@selector(postButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _postButton;
}


@end
