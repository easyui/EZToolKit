//
//  NSObject+EZ_Dealloc.m
//  EZToolKit
//
//  Created by yangjun zhu on 2017/1/6.
//  Copyright © 2017年 Cactus. All rights reserved.
//

#import "NSObject+EZ_Dealloc.h"
#import <objc/runtime.h>

@interface EZBlockExecutor() {
    voidBlock _block;
}
@end


@implementation EZBlockExecutor
- (id)initWithBlock:(voidBlock)aBlock
{
    self = [super init];
    
    if (self) {
        _block = [aBlock copy];
    }
    
    return self;
}

- (void)dealloc
{
    _block ? _block() : nil;
}

@end

const void *runAtDeallocBlockKey = &runAtDeallocBlockKey;

@implementation NSObject (EZ_Dealloc)
- (void)ez_runAtDealloc:(voidBlock)block{
    if (block) {
        EZBlockExecutor *executor = [[EZBlockExecutor alloc] initWithBlock:block];
        
        objc_setAssociatedObject(self,
                                 runAtDeallocBlockKey,
                                 executor,
                                 OBJC_ASSOCIATION_RETAIN);
    }
}
@end
