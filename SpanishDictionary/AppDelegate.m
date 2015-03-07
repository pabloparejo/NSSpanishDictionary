//
//  AppDelegate.m
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "AppDelegate.h"
#import "PARDictionaryViewController.h"
#import "PARWordViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    
    PARDictionary *dict = [PARDictionary dictionaryWithWords:@{@"a": @[[PARWord wordWithName:@"arca"]],
                                                               @"b": @[[PARWord wordWithName:@"barco"],
                                                                       [PARWord wordWithName:@"botijo"]]}];

    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        [self configureForIPadWithModel:dict];
    }else{
        [self configureForIPhoneWithModel:dict];
    }

    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void) configureForIPadWithModel:(PARDictionary *) dictionary{
    PARDictionaryViewController *dictVC = [[PARDictionaryViewController alloc] initWithModel: dictionary];
    PARWordViewController *wordVC = [[PARWordViewController alloc] initWithModel:[dictionary wordForKey:@"a" AtIndex:0]];
    
    UINavigationController *navDictVC = [[UINavigationController alloc] initWithRootViewController:dictVC];
    UINavigationController *navWordVC = [[UINavigationController alloc] initWithRootViewController:wordVC];
    
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    [splitVC setViewControllers:@[navDictVC, navWordVC]];
    
    [dictVC setDelegate:wordVC];
    [splitVC setDelegate:wordVC];
    
    [self.window setRootViewController:splitVC];
}

- (void) configureForIPhoneWithModel:(PARDictionary *) dictionary{
    PARDictionaryViewController *vc = [[PARDictionaryViewController alloc] initWithModel: dictionary];
    [vc setDelegate:vc];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self.window setRootViewController:navVC];
}

@end
