//
//  DetailsTableViewCell.m
//  JsonRequest
//
//  Created by John Lima on 18/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import "DetailsTableViewCell.h"

@implementation DetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)setup:(Country *)country {
    if (country) {
        [self.name setText:[NSString stringWithFormat:@"Name: %@", country.name]];
        [self.nativeName setText:[NSString stringWithFormat:@"Native Name: %@", country.nativeName]];
        [self.capital setText:[NSString stringWithFormat:@"Capital: %@", country.capital]];
        [self.area setText:[NSString stringWithFormat:@"Area: %.0f", country.area]];
        [self.population setText:[NSString stringWithFormat:@"Population: %d", country.population]];
        [self.region setText:[NSString stringWithFormat:@"Region: %@", country.region]];
        [self.relevance setText:[NSString stringWithFormat:@"Relevance: %@", country.relevance]];
        [self.subregion setText:[NSString stringWithFormat:@"Sub Region: %@", country.subregion]];
    }
}

@end
