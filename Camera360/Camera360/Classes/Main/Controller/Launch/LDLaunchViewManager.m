//
//  LDLaunchViewManager.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/8.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDLaunchViewManager.h"
#import "LDLaunchView.h"
#import "LDAdWebViewController.h"

//广告倒计时间 单位：秒
#define DURATION 5

static NSString *const kDownImageKey = @"kDownImageKey";

@interface LDLaunchViewManager ()

@property (nonatomic, strong) LDLaunchView *launchView;

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation LDLaunchViewManager

+ (instancetype)launchViewManger {
    
    return [[[ self class] alloc] init];
    
}

-(void)showView:(UIView *)view {
    
    NSMutableData *data = [[NSUserDefaults standardUserDefaults]objectForKey:kDownImageKey];
    
    if (data.length > 0) {
        
        self.frame = view.bounds;
        [view addSubview:self];
        [self addSubview:self.launchView];
        
        [self setAdImage:[UIImage imageWithData:data]];
        
    }else{
        
        
    }
    
    [self downloadImage:self.adModel.launchUrl];
    
}

- (void)setAdImage:(UIImage *)image {
    
    self.launchView.adImageView.image = image;
    
    [self scheduledGCDTimer];
    
}

- (void)showSkipBtnTitleTime:(int)timeLeave {
    
    NSString *timeLeaveStr = [NSString stringWithFormat:@"跳过 %ds",timeLeave];
    [_launchView.skipBtn setTitle:timeLeaveStr forState:UIControlStateNormal];
    _launchView.skipBtn.hidden = NO;
}

- (void)scheduledGCDTimer {
    
    [self cancleGCDTimer];
    __block int timeLeave = DURATION; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    __typeof (self) __weak weakSelf = self;
    dispatch_source_set_event_handler(_timer, ^{
        if(timeLeave <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(weakSelf.timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //关闭界面
                [self dismissController];
            });
        }else{
            int curTimeLeave = timeLeave;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面
                [weakSelf showSkipBtnTitleTime:curTimeLeave];
                
            });
            --timeLeave;
        }
    });
    dispatch_resume(_timer);
}

- (void)cancleGCDTimer {
    
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

- (void)downloadImage:(NSString *)urlString {
    
    //下面这段代码，是调用AFN下载文件的方法，异步
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {

        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);

        NSData * image = [NSData dataWithContentsOfURL:filePath];
        [[NSUserDefaults standardUserDefaults] setObject:image forKey:kDownImageKey];

        
    }];
    [downloadTask resume];
    
}

#pragma mark - action

- (void)skipADAction {
    
    [self dismissController];
}

- (void)dismissController {
    
    [self cancleGCDTimer];
    //消失动画
    [UIView animateWithDuration:0.0 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        //缩放修改处
        self.transform = CGAffineTransformMakeScale(1, 1);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)pushAdController {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
        LDAdWebViewController * adVc=[[LDAdWebViewController alloc]init];
        adVc.adModel=self.adModel;
        adVc.hidesBottomBarWhenPushed=YES;
        [[UIApplication sharedApplication].keyWindow.rootViewController.childViewControllers[0] pushViewController:adVc animated:YES];
    });
}

#pragma mark - lazy
- (LDLaunchView *)launchView {
    if (_launchView == nil) {
        _launchView = [[LDLaunchView alloc] init];
        _launchView.skipBtn.hidden = YES;
        _launchView.launchImageView.image = [UIImage imageToLaunchImage];
        _launchView.frame=self.bounds;
        [_launchView.skipBtn addTarget:self action:@selector(skipADAction) forControlEvents:UIControlEventTouchUpInside];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pushAdController)];
        [_launchView addGestureRecognizer:tap];
    }
    return _launchView;
}

- (void)dealloc {
    [self cancleGCDTimer];
}

@end
