//
//  NSURL+EZ_Helper.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/6/9.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "NSURL+EZ_Helper.h"

@implementation NSURL (EZ_Helper)
- (NSDictionary *)ez_parameters{
    NSArray * queryComponents = [self.query componentsSeparatedByString:@"&"];
    NSMutableDictionary * parametersDictionary = [[NSMutableDictionary alloc] initWithCapacity:queryComponents.count];
    for (NSString * queryComponent in queryComponents) {
        NSString * key = [queryComponent componentsSeparatedByString:@"="].firstObject;
        NSString * value = [queryComponent substringFromIndex:(key.length + 1)];
        [parametersDictionary setObject:value forKey:key];
    }
    return parametersDictionary;
}

- (NSString *)ez_valueForParameter:(NSString *)parameterKey{
    return [[self ez_parameters] objectForKey:parameterKey];
}
@end
