//
//  UIView+Extension.m
//  FMsecert
//
//  Created by Vincent_Guo on 15-3-16.
//  Copyright (c) 2015年 Fung. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setSize:(CGSize)size {
    self.bounds = CGRectMake(0, 0, size.width, size.height);
}

- (CGSize)size{
    return self.bounds.size;
}

- (void)setW:(CGFloat)w {
    
    CGRect frm = self.frame;
    frm.size.width = w;
    self.frame = frm;
}

- (CGFloat)w {
    return self.size.width;
}


- (void)setH:(CGFloat)h {
    CGRect frm = self.frame;
    frm.size.height = h;
    self.frame = frm;
}

- (CGFloat)h {
    return self.size.height;
}

- (void)setX:(CGFloat)x {
    CGRect frm = self.frame;
    frm.origin.x = x;
    
    self.frame = frm;
}
- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frm = self.frame;
    frm.origin.y = y;
    self.frame = frm;
    
}

- (CGFloat)y {
    return self.frame.origin.y;
}


- (void)setCenter_X:(CGFloat)center_X
{
    CGPoint center = self.center;
    center.x = center_X;
    self.center = center;
}

- (CGFloat)center_X
{
    return self.center.x;
}

- (void)setCenter_Y:(CGFloat)center_Y
{
    CGPoint center = self.center;
    center.y = center_Y;
    self.center = center;
}

- (CGFloat)center_Y
{
    return self.center.y;
}

- (BOOL)ld_intersectsWithView:(UIView *)view
{
    //都先转换为相对于窗口的坐标，然后进行判断是否重合
    CGRect selfRect = [self convertRect:self.bounds toView:nil];
    CGRect viewRect = [view convertRect:view.bounds toView:nil];
    return CGRectIntersectsRect(selfRect, viewRect);
}

+ (instancetype)ld_viewFromXib
{
    
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].firstObject;
}

#pragma mark 显示在主窗口
-(void)showViewOnMainWindow{
    
    if(!self.superview){
        NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
        for (UIWindow *window in frontToBackWindows){
            BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
            BOOL windowIsVisible = !window.hidden && window.alpha > 0;
            BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
            
            if (windowOnMainScreen && windowIsVisible && windowLevelNormal) {
                [window addSubview:self];
                break;
            }
        }
    } else {
        // Ensure that overlay will be exactly on top of rootViewController (which may be changed during runtime).
        [self.superview bringSubviewToFront:self];
    }
}



@end
