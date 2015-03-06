//
//  PARDictionaryViewControllerTableViewController.h
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PARDictionary.h"

@interface PARDictionaryViewController : UITableViewController

@property (strong, nonatomic) PARDictionary *model;

- (instancetype) initWithModel:(PARDictionary *) model;

@end
