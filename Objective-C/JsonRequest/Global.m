//
//  Global.m
//  JsonRequest
//
//  Created by John Lima on 18/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import "Global.h"

@implementation Global

#pragma mark - Alerts
+(void)showAlert:(NSString *)title and:(NSString *)message and:(NSArray *)actions and:(id)target {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (actions.count > 0) {
        for (UIAlertAction *action in actions) {
            [alert addAction:action];
        }
    }
    
    [target presentViewController:alert animated:true completion:nil];
}

@end
