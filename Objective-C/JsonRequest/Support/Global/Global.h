//
//  Global.h
//  JsonRequest
//
//  Created by John Lima on 18/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// -- Texts
#define TEXT_OK @"Ok"
#define TEXT_ALERT @"Alert"
#define TEXT_ERROR @"Error"
#define TEXT_NO_DATA @"No data";
// -- Segues
#define SEGUE_DETAILS @"Details"

@interface Global : NSObject

#pragma mark - Actions
+(void)showAlert:(NSString *)title and:(NSString *)message and:(NSArray *)actions and:(id)target;

@end
