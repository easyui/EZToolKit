//
//  NSObject+EZ_Helper.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/6/10.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef id (^EZWeakReference)(void);

@interface NSObject (EZ_Helper)
- (id)ez_performSelector:(SEL)aSelector withObject:(NSArray *)objects;

- (NSUInteger)ez_retainCount;


EZWeakReference ez_makeWeakReference(id object);

id ez_weakReferenceNonretainedObjectValue(EZWeakReference ref);



/**
 对象的tag，可以相同
 */
@property (nonatomic, strong) NSString *nameTag;

@end
