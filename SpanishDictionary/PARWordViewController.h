//
//  WordViewController.h
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PARWord.h"

@interface PARWordViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) PARWord *model;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

-(instancetype) initWithModel:(PARWord *) word;

@end
