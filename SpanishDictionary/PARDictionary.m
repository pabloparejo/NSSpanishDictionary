//
//  Dictionary.m
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARDictionary.h"

@implementation PARDictionary

-(instancetype) initWithWords: (NSArray *) words{
    if (self = [super init]) {
        _words = words;
    }
    return self;
}

+(instancetype) dictionaryWithWords: (NSArray *) words{
    return [[self alloc] initWithWords:words];
}

-(PARWord *)wordAtIndex: (NSUInteger) position{
    return [self.words objectAtIndex:position];
}

-(NSUInteger)count{
    return [self.words count];
}



@end
