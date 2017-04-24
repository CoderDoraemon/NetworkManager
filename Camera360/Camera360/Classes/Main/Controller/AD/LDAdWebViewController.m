//
//  LDADWebViewController.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/8.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDAdWebViewController.h"
#import "LDWebViewProgressView.h"
#import "LDAdModel.h"
#import <WebKit/WebKit.h>

@interface LDAdWebViewController () <WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *webView;

@property (nonatomic,strong) LDWebViewProgressView *webProgressView;

@end

@implementation LDAdWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.adModel.adDetailUrl]];
    [self.webView loadRequest:request];
    [self.webView setNeedsUpdateConstraints];
    
    [self.view addSubview:self.webProgressView];
    
    [self addObservers];
}
- (void)addObservers {
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)dealloc {
    
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView.scrollView removeObserver:self forKeyPath:@"contentSize"];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if (object == self.webView) {
            [self.webProgressView setProgress:self.webView.estimatedProgress animated:YES];
        }else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
        
    }else if ([keyPath isEqualToString:@"title"]) {
        if (object == self.webView) {
            self.title = self.webView.title;
        }
        else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else if ([keyPath isEqualToString:@"contentSize"]){
        if (object == self.webView.scrollView) {
            //                  self.scrollView.contentSize = self.webView.scrollView.contentSize;
        }else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}
#pragma mark - WebView Delegate -
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self.webProgressView setProgress:0 animated:YES];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
}

#pragma mark - lazy
- (WKWebView *)webView {
    if (_webView == nil) {
        
        _webView = [[WKWebView alloc] init];
        
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.navigationDelegate = self;
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _webView.scrollView.backgroundColor = [UIColor whiteColor];
        _webView.allowsBackForwardNavigationGestures = YES;
    }
    return _webView;
}

- (LDWebViewProgressView *)webProgressView {
    if (_webProgressView == nil) {
        
        CGFloat progressBarHeight = 2.f;
        _webProgressView = [[LDWebViewProgressView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, progressBarHeight)];
        _webProgressView.progressBarColor = [UIColor orangeColor];
        _webProgressView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _webProgressView;
}

@end
