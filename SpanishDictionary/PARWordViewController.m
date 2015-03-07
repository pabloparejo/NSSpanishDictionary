//
//  WordViewController.m
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARWordViewController.h"
#import "PARDictionaryViewController.h"

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
    [self syncViewWithModel];
    
    //DisplayMode por defecto para el SplitVC
    if (self.splitViewController.displayMode != UISplitViewControllerDisplayModeAllVisible) {
        self.navigationItem.leftItemsSupplementBackButton = YES;
        self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    }

    self.view.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
navigationType:(UIWebViewNavigationType)navigationType{

    [self.activity startAnimating];
    [self.activity setHidden:NO];
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    UIViewAnimationOptions options = UIViewAnimationOptionBeginFromCurrentState |UIViewAnimationOptionCurveEaseInOut;

    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1 delay:0 options:options animations:^{
        [weakSelf.activity setAlpha:0];
    } completion:^(BOOL finished) {
        if (finished) {
            [weakSelf.activity setHidden:YES];
            [weakSelf.activity stopAnimating];
        }
    }];
}

#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc
    willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    if (displayMode != UISplitViewControllerDisplayModeAllVisible) {
        self.navigationItem.leftItemsSupplementBackButton = YES;
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }
}

#pragma mark - PARDictionaryViewControllerDelegate
- (void) dictionaryViewController:(PARDictionaryViewController *) vc
                    didSelectWord:(PARWord *) word{
    self.model = word;
    [self syncViewWithModel];
}

-(void) syncViewWithModel{
    if (self.model == nil) {
        [self.webView loadHTMLString:@"<html><body style='background:#FAFAFA;height:100%;width:100%;padding-top:3rem'><h2 style='text-align:center;font-family:Helvetica'>Please, choose 'una palabra'</h2></body></html>"
                             baseURL:nil];
    }else{
        [self.webView loadRequest:[NSURLRequest requestWithURL:self.model.url]];
        self.title = self.model.name;
    }
}
@end