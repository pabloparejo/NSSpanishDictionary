//
//  Word.h
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PARWord : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSURL *url;

+(instancetype) wordWithName: (NSString *) name;


@end
