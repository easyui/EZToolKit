//
//  NSString+EZ_Parse.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "NSString+EZ_Parse.h"

@implementation NSString (EZ_Parse)
- (id)ez_JSONObject{
    if(self == nil){
        return self;
    }
    NSError *err = nil;
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    id jsonValue = [NSJSONSerialization JSONObjectWithData:data
                                                   options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves
                                                     error:&err];
    
    if(err)
        NSLog(@"%s %@", __FUNCTION__,[err description]);
    return jsonValue;
}
@end
