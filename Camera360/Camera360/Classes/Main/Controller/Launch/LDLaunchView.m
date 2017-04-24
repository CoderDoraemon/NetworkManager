//
//  LDLaunchView.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/8.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDLaunchView.h"

//跳过按钮宽
#define kSkipBtnWidth 65
//跳过按钮高
#define kSkipBtnHeight 30
//跳过按钮右边距
#define kSkipRightEdging 20
//跳过按钮顶部边距
#define kSkipTopEdging 40
//默认广告页面高度
#define kAdImageViewHeight (kScreenHeight - 100)

@implementation LDLaunchView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    [self addSubview:self.launchImageView];
    [self addSubview:self.adImageView];
    [self addSubview:self.skipBtn];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _launchImageView.frame = self.bounds;
    
    _adImageView.frame = CGRectMake(0, 0, k_SCREEN_W, k_SCREEN_H - 100);
    
    _skipBtn.frame = CGRectMake(CGRectGetWidth(self.frame) - kSkipBtnWidth - kSkipRightEdging, kSkipTopEdging, kSkipBtnWidth, kSkipBtnHeight);
}


#pragma mark - lazy
- (UIImageView *)launchImageView {
    if (_launchImageView == nil) {
        _launchImageView = [[UIImageView alloc] init];
    }
    return _launchImageView;
}

- (UIButton *)skipBtn {
    if (_skipBtn == nil) {
        _skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _skipBtn.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        [_skipBtn setTitle:@"跳过" forState:UIControlStateNormal];
        _skipBtn.titleLabel.textColor = [UIColor whiteColor];
        _skipBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _skipBtn.alpha = 0.92;
        _skipBtn.layer.cornerRadius = 4.0;
        _skipBtn.clipsToBounds = YES;
    }
    return _skipBtn;
}

- (UIImageView *)adImageView {
    if (_adImageView == nil) {
        _adImageView = [[UIImageView alloc] init];
        _adImageView.contentMode = UIViewContentModeScaleAspectFill;
        _adImageView.layer.masksToBounds = YES;
    }
    return _adImageView;
}

@end
