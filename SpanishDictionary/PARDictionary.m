//
//  Dictionary.m
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARDictionary.h"

@implementation PARDictionary

-(instancetype) initWithWords: (NSDictionary *) words{
    if (self = [super init]) {
        _words = words;
    }
    return self;
}

+(instancetype) dictionaryWithWords: (NSDictionary *) words{
    return [[self alloc] initWithWords:words];
}

-(PARWord *)wordForKey: (NSString *)key AtIndex: (NSUInteger) position{
    return [[self.words objectForKey:key] objectAtIndex:position];
}

-(NSUInteger)sections{
    return [self.words count];
}

-(NSUInteger)countForKey:(NSString *) key{
    return [[self.words objectForKey:key] count];
}

-(NSString *)keyForIndex:(NSUInteger) index{
    return [[self.words allKeys] objectAtIndex:index];
}


@end
