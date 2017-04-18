//
//  Country.m
//  JsonRequest
//
//  Created by John Lima on 15/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import "Country.h"

#define KEY_AREA @"area"
#define KEY_CAPITAL @"capital"
#define KEY_NAME @"name"
#define KEY_NATIVENAME @"nativeName"
#define KEY_POPULATION @"population"
#define KEY_REGION @"region"
#define KEY_RELEVANCE @"relevance"
#define API_COUNTRIES @"https://restcountries.eu/rest/v1/all"

@implementation Country

-(id)initWithJson:(NSDictionary *)dictionary {

    self = [super init];
    
    if (self) {
        
        NSString *stringArea = [NSString stringWithFormat:@"%@", [dictionary valueForKey:KEY_AREA]];
        
        [self setArea: stringArea.doubleValue > 0 ? stringArea.doubleValue : 0];
        [self setCapital:[dictionary valueForKey:KEY_CAPITAL]];
        [self setName:[dictionary valueForKey:KEY_NAME]];
        [self setNativeName:[dictionary valueForKey:KEY_NATIVENAME]];
        [self setPopulation:[[dictionary valueForKey:KEY_POPULATION] intValue]];
        [self setRegion:[dictionary valueForKey:KEY_REGION]];
        [self setRelevance:[dictionary valueForKey:KEY_RELEVANCE]];
    }
    
    return self;
}


-(void)downloadJSONFromURLWith:(void (^)(NSArray *array, NSString *error))completion {
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:API_COUNTRIES];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError * parseError = nil;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        
        if (jsonArray.count > 0) {
            
            NSLog(@"JSON: %@", jsonArray);
            
            for (NSDictionary *json in jsonArray) {
                Country *country = [[Country alloc] initWithJson:json];
                [result addObject:country];
            }
        }
        
        completion(result, parseError.localizedDescription);
    }];
    
    [task resume];
}

@end
