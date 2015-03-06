//
//  PARDictionaryViewControllerTableViewController.m
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARDictionaryViewController.h"
#import "PARWordViewController.h"

@interface PARDictionaryViewController ()

@end

@implementation PARDictionaryViewController

- (instancetype) initWithModel:(PARDictionary *) model{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Spanish Dictionary";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    
    PARWord *word = [self.model wordAtIndex:indexPath.row];
    
    [cell.textLabel setText:word.name];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PARWord *word = [self.model wordAtIndex:indexPath.row];
    
    PARWordViewController *vc = [[PARWordViewController alloc] initWithModel:word];
    [self.navigationController pushViewController:vc animated:YES];

    
}

@end
