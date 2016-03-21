//
//  FTNewsDetailController.m
//  FootNews
//
//  Created by mac on 16/3/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "FTNewsDetailController.h"
#import <WebKit/WebKit.h>
#import "UIView+Extension.h"

@interface FTNewsDetailController ()<WKNavigationDelegate>
@property (weak, nonatomic)  WKWebView *webView;
@property (strong, nonatomic)  UIActivityIndicatorView *activityIndicator;

@end

@implementation FTNewsDetailController
static NSString * const requestURL = @"http://api.football.app887.com/article.html?id=";
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
- (UIActivityIndicatorView *)activityIndicator
{
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicator.center = self.view.center;
        _activityIndicator.hidden = YES;
        _activityIndicator.hidesWhenStopped = YES;
        [self.view addSubview:_activityIndicator];
        self.activityIndicator = _activityIndicator;
    }
    return _activityIndicator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64)];
    
    [self.view addSubview:webView];
    self.webView = webView;
    NSString *requestString = [requestURL stringByAppendingString:self.ID];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:requestString]]];
    
    self.webView.navigationDelegate = self;
//    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;
    
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    
//    NSLog(@"%@",navigationAction.request.URL.absoluteString);
    if ([navigationAction.request.URL.absoluteString hasPrefix:@"unsafe"]) {
        NSString *ID = [[navigationAction.request.URL.absoluteString componentsSeparatedByString:@"id="] lastObject];
        NSURL *url = [NSURL URLWithString:[requestURL stringByAppendingString:ID]];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    [self.activityIndicator stopAnimating];
}
@end
