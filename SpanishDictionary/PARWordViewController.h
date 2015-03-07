//
//  WordViewController.h
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PARWord.h"
#import "PARDictionaryViewController.h"

@interface PARWordViewController : UIViewController <UIWebViewDelegate, UISplitViewControllerDelegate, PARDictionaryViewControllerDelegate>

@property (strong, nonatomic) PARWord *model;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

-(instancetype) initWithModel:(PARWord *) word;

@end
