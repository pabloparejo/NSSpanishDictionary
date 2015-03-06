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

@property (nonatomic, strong) NSDictionary *words;

-(instancetype) initWithWords: (NSDictionary *) words;
+(instancetype) dictionaryWithWords: (NSDictionary *) words;

-(PARWord *)wordForKey: (NSString *) key AtIndex: (NSUInteger) position;
-(NSUInteger)sections;
-(NSUInteger)countForKey:(NSString *) key;
-(NSString *)keyForIndex:(NSUInteger) index;

@end
