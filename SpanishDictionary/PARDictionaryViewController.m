//
//  PARDictionaryViewControllerTableViewController.m
//  SpanishDictionary
//
//  Created by Pablo Parejo Camacho on 6/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARDictionaryViewController.h"
#import "PARWordViewController.h"

#define CELL_IDENTIFIER @"MyIdentifier"

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
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_IDENTIFIER];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.model sections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = [self.model keyForIndex:section];
    return [self.model countForKey:key];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    
    NSString *key = [self.model keyForIndex:indexPath.section];
    PARWord *word = [self.model wordForKey:key AtIndex:indexPath.row];
    
    [cell.textLabel setText:word.name];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *key = [self.model keyForIndex:indexPath.section];
    
    PARWord *word = [self.model wordForKey:key AtIndex:indexPath.row];
    
    PARWordViewController *vc = [[PARWordViewController alloc] initWithModel:word];
    [self.navigationController pushViewController:vc animated:YES];

    
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.model keyForIndex:section];
}

@end
