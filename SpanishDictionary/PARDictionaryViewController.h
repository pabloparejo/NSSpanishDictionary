//
//  PARDictionaryViewControllerTableViewController.h
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PARDictionary.h"

@class PARDictionaryViewController;

@protocol PARDictionaryViewControllerDelegate <NSObject>

- (void) dictionaryViewController:(PARDictionaryViewController *) vc
                    didSelectWord:(PARWord *) word;

@end


@interface PARDictionaryViewController : UITableViewController <PARDictionaryViewControllerDelegate>

@property (strong, nonatomic) PARDictionary *model;
@property (weak, nonatomic) id<PARDictionaryViewControllerDelegate> delegate;

- (instancetype) initWithModel:(PARDictionary *) model;
@end

