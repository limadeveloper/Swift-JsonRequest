//
//  Country.m
//  JsonRequest
//
//  Created by John Lima on 15/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import "Country.h"
#import <AFNetworking.h>

#define KEY_AREA @"area"
#define KEY_CAPITAL @"capital"
#define KEY_NAME @"name"
#define KEY_NATIVENAME @"nativeName"
#define KEY_POPULATION @"population"
#define KEY_REGION @"region"
#define KEY_RELEVANCE @"relevance"
#define KEY_SUBREGION @"subregion"
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
        [self setSubregion:[dictionary valueForKey:KEY_SUBREGION]];
    }
    
    return self;
}

-(void)downloadJSONFromURLWith:(void (^)(NSArray *array, NSString *error))completion {
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSURL *url = [NSURL URLWithString:API_COUNTRIES];
    NSURLSession *session = [NSURLSession sharedSession];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:15];
    
    NSLog(@"url: %@", url);
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (error) {
            completion(nil, error.localizedDescription);
            return;
        }
        
        NSError * parseError = nil;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        
        if (jsonArray.count > 0) {
            
            for (NSDictionary *json in jsonArray) {
                Country *country = [[Country alloc] initWithJson:json];
                [result addObject:country];
            }
        }
        
        completion(result, parseError.localizedDescription);
    }];
    
    [task resume];
}

-(void)downloadJSONFromURLUsingAFNetworkingWith:(void (^)(NSArray *, NSString *))completion {

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *url = [[NSURL alloc] initWithString:API_COUNTRIES];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            completion(nil, error.localizedDescription);
            return;
        }
        
        NSLog(@"\nresponse: %@\nresponse object: %@", response, responseObject);
    }];
    
    [dataTask resume];
}

@end
