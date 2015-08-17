//
//  NSObject+EZ_Parse.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "NSObject+EZ_Parse.h"

@implementation NSObject (EZ_Parse)

- (NSString *)ez_prettyJSONString {
    return [self __JSONStringWithOption:NSJSONWritingPrettyPrinted];
}

- (NSString *)ez_JSONStringRepresentation {
    return [self __JSONStringWithOption:0];
}


-(NSString*)__JSONStringWithOption:(int) option
{
    if(self == nil){
        return nil;
    }
    NSError *err = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:option
                                                     error:&err];
    
    if(err)
        NSLog(@"%@", [err description]);
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}
@end
