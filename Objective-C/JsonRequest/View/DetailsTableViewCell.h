//
//  DetailsTableViewCell.h
//  JsonRequest
//
//  Created by John Lima on 18/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

@interface DetailsTableViewCell : UITableViewCell

#pragma mark - Properties
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *nativeName;
@property (weak, nonatomic) IBOutlet UILabel *capital;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *population;
@property (weak, nonatomic) IBOutlet UILabel *region;
@property (weak, nonatomic) IBOutlet UILabel *relevance;
@property (weak, nonatomic) IBOutlet UILabel *subregion;

#pragma mark - Actions
-(void)setup:(Country *)country;

@end
