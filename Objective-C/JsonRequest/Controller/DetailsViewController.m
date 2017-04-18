//
//  DetailsViewController.m
//  JsonRequest
//
//  Created by John Lima on 18/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsTableViewCell.h"
#import "Global.h"

@interface DetailsViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation DetailsViewController

#pragma mark - View LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateUI];
}

#pragma mark - Actions
-(void)updateUI {

    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tableView.tableFooterView = footer;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - TableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.country) {
        DetailsTableViewCell *defaultCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        [defaultCell setup:self.country];
        return defaultCell;
    }
    
    UITableViewCell *emptyCell = [tableView dequeueReusableCellWithIdentifier:@"cellEmpty" forIndexPath:indexPath];
    emptyCell.textLabel.text = TEXT_NO_DATA;
    return emptyCell;
}

#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
