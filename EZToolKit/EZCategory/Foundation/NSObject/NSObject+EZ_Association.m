//
//  NSObject+EZ_Association.m
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import "NSObject+EZ_Association.h"
#import <objc/runtime.h>

@implementation NSObject (EZ_Association)

- (id)ez_associatedObjectForKey:(NSString*)key {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, @selector(ez_associatedObjectForKey:));
    return [dict objectForKey:key];
}

- (void)ez_setAssociatedObject:(id)object forKey:(NSString*)key {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, @selector(ez_associatedObjectForKey:));
    if (!dict) {
        dict = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(ez_associatedObjectForKey:), dict, OBJC_ASSOCIATION_RETAIN);
    }
    [dict setObject:object forKey:key];
}
@end
