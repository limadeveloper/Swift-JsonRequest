//
//  ViewController.m
//  JsonRequest
//
//  Created by John Lima on 15/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import "ViewController.h"
#import "Country.h"
#import "Global.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

#pragma mark - Properties
Country *country;
NSArray *countries;
NSString *const cellName = @"cell";
UIRefreshControl *refreshControll;

#pragma mark - View LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateUI];
    [self getData];
    [self setupRefresh];
}

#pragma mark - Actions
-(void)getData {

    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    country = [[Country alloc] init];
    countries = [[NSArray alloc] init];
    
    [country downloadJSONFromURLWith:^(NSArray *data, NSString *error) {
        
        if (!error) {
            countries = data;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self updateUI];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
            [refreshControll endRefreshing];
            
            if (error) {
                UIAlertAction *dismissAlert = [UIAlertAction actionWithTitle:TEXT_OK style:UIAlertActionStyleDestructive handler:nil];
                [Global showAlert:TEXT_ERROR and:error and:@[dismissAlert] and:self];
            }
        });
    }];
    
    [country downloadJSONFromURLUsingAFNetworkingWith:nil];
}

-(void)updateUI {

    NSLog(@"Countries: %d", (int)countries.count);
    
    [self.countButton setTitle:[NSString stringWithFormat:@"%d", (int)countries.count]];
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tableView.tableFooterView = footer;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView reloadData];
}

-(void)setupRefresh {

    refreshControll = [[UIRefreshControl alloc] init];
    refreshControll.tintColor = [UIColor purpleColor];
    [refreshControll addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:refreshControll];
}

-(void)refreshData {
    [self getData];
}

#pragma mark - TableView DataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return countries.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName forIndexPath:indexPath];
    
    if (countries.count > 0) {
        cell.textLabel.text = [((Country *)[countries objectAtIndex:indexPath.row]) name];
    }
    
    return cell;
}

#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
