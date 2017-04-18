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
    
    Country *c = [[Country alloc] init];
    
    [c downloadJSONFromURLWith:^(NSArray *countries, NSString *error) {
        NSLog(@"\ncount: %d\nerror: %@\n", (int)countries.count, error);
        NSLog(@"\nname: %@\narea: %.0f\n", [(Country *)(countries.lastObject) name], [(Country *)(countries.lastObject) area]);
    }];
}

@end
