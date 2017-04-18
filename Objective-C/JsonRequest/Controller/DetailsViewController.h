//
//  DetailsViewController.h
//  JsonRequest
//
//  Created by John Lima on 18/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

@interface DetailsViewController : UIViewController

#pragma mark - Properties
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Country *country;

@end
