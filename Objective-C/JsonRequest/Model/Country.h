//
//  Country.h
//  JsonRequest
//
//  Created by John Lima on 15/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property(nonatomic, assign) double area;
@property(nonatomic, strong) NSString *capital;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *nativeName;
@property(nonatomic, assign) int population;
@property(nonatomic, strong) NSString *region;
@property(nonatomic, strong) NSString *relevance;

-(void)downloadJSONFromURLWith:(void (^)(NSArray *countries, NSString *error))completion;
-(void)downloadJSONFromURLUsingAFNetworkingWith:(void (^)(NSArray *countries, NSString *error))completion;

@end
