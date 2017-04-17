//
//  ViewController.m
//  JsonRequest
//
//  Created by John Lima on 15/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import "ViewController.h"
#import "Country.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Country *c;
    
    [c downloadJSONFromURLWith:^(NSArray *countries, NSString *error) {
        NSLog(@"count: %d\n error: %@", (int)countries.count, error);
    }];
}

@end
