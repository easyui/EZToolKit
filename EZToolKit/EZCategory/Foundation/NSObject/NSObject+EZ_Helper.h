//
//  NSObject+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/6/10.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (EZ_Helper)
- (id)ez_performSelector:(SEL)aSelector withObject:(NSArray *)objects;

- (NSUInteger)ez_retainCount;
@end
