//
//  WordViewController.m
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARWordViewController.h"
#import "PARDictionaryViewController.h"

@interface PARWordViewController() <UIActionSheetDelegate>

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

    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
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

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error loading page"
                                                                   message:@"Sorry, we couldn't load the page"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"Cancel"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction *action) {
                                                        [alert dismissViewControllerAnimated:YES completion:nil];
                                                          }];
    __weak typeof(self) weakSelf = self;
    UIAlertAction *actionReload = [UIAlertAction actionWithTitle:@"Reload"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action) {
                                                             [weakSelf syncViewWithModel];
                                                         }];

    [alert addAction:actionCancel];
    [alert addAction:actionReload];
    
    [self presentViewController:alert animated:YES completion:nil];
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