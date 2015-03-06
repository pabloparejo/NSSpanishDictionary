//
//  Word.m
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARWord.h"

@implementation PARWord

+(instancetype) wordWithName:(NSString *) name{
    return [[self alloc] initWithWord:name];
}

-(id) initWithWord:(NSString*) name{
    if (self = [super init]) {
        _name = name;
        _url = [NSURL URLWithString:[@"http://lema.rae.es/drae/srv/search?val=" stringByAppendingString:name]];
    }
    return self;
}

@end
