//
//  WordViewController.m
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARWordViewController.h"

@interface PARWordViewController()

@end

@implementation PARWordViewController

-(instancetype) initWithModel:(PARWord*) model{
    if (self = [super init]) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView setDelegate:self];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.model.url]];
    self.title = self.model.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
navigationType:(UIWebViewNavigationType)navigationType{
    
    NSLog(@"loading...");
    return YES;
}

@end
