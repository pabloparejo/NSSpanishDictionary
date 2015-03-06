//
//  Dictionary.h
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PARWord.h"

@interface PARDictionary : NSObject

@property (nonatomic, strong) NSArray *words;

-(instancetype) initWithWords: (NSArray *) words;
+(instancetype) dictionaryWithWords: (NSArray *) words;

-(PARWord *)wordAtIndex: (NSUInteger) position;
-(NSUInteger)count;

@end
