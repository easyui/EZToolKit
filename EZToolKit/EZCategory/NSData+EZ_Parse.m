//
//  NSData+EZ_Parse.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "NSData+EZ_Parse.h"

@implementation NSData (EZ_Parse)
- (id)ez_JSONData
{
    if(self == nil){
        return nil;
    }
    NSError *err = nil;
    id jsonValue = [NSJSONSerialization JSONObjectWithData:self
                                                   options:0
                                                     error:&err];
    if(err)
        NSLog(@"%s %@", __FUNCTION__,[err description]);
    return jsonValue;
}
@end
